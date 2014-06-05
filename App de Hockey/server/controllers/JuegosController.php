<?php

class JuegosController extends Controller
{
	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	public $layout='//layouts/column2';

	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
		   
		);
	}

	/**
	 * Specifies the access control rules.
	 * This method is used by the 'accessControl' filter.
	 * @return array access control rules
	 */
	public function accessRules()
	{
		return array(
			array('allow',  // allow all users to perform 'index' and 'view' actions
				'actions'=>array('index','view'),
				'users'=>array('*'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete'),
				'users'=>array('admin'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}

	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView($id)
	{
		$this->render('view',array(
			'model'=>$this->loadModel($id),
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new Juegos;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Juegos']))
		{
			$model->attributes=$_POST['Juegos'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id));
		}

		$this->render('create',array(
			'model'=>$model,
		));
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Juegos']))
		{
			$model->attributes=$_POST['Juegos'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id));
		}

		$this->render('update',array(
			'model'=>$model,
		));
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		$this->loadModel($id)->delete();

		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
		if(!isset($_GET['ajax']))
			$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{    
		$i=0;     
		$dataProvider=new CActiveDataProvider('Juegos'); 
		
		//esta es la informacion que el usuario va a requestiar 
		 $data = array();
		
		$juegos = Juegos::model()->with('goles','visitante','casa','fotoPortada','fotoEquipo')->findAll(); 
		                
		foreach ($juegos as $juego) {
			foreach ($juego->goles as $gol) {
			    if ($gol->idEquipo == $juego->idEquipoCasa) {
					 $juegos[$i]->golesCasa++;
				}else {
					 $juegos[$i]->golesVisitantes++;
				}   
			}  
			  $dataSup = array(
					"nombreEquipoVisitante"=>$juego->visitante->nombre,
					"urlEquipoVisitante"=>$juego->visitante->fotoPortada->url,
					"golesEquipoVisitante"=>$juego->golesVisitantes,
					"nombreEquipoCasa"=>$juego->casa->nombre,
					"urlEquipoCasa"=>$juego->casa->fotoPortada0->url,
					"golesEquipoCasa"=>$juego->golesCasa,
					"tiempo"=>$juego->tiempo,
					"fechaDelJuego"=>$juego->fecha, 
					"liga"=>$juego->visitante->liga,
				   	);			
				//paso los datos de dataSuplementary a data 

				array_push($data,$dataSup);
			
			$i++; 	  
		 }
		
		
		$this->render('index',array(
			'dataProvider'=>$dataProvider,  
			'juegos'=>$juegos, 
			'data'=>$data, 
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Juegos('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Juegos']))
			$model->attributes=$_GET['Juegos'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Juegos the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Juegos::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Juegos $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='juegos-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}    
	public function actionGetGames()
	{
		
		$i=0;     		
		$juegos = Juegos::model()->with('goles','visitante','casa','visitante.fotoPortada', 'casa.fotoPortada','fotoEquipo')->findAll();    
		  
		//esta es la informacion que el usuario va a requestiar 
		$data = array(); 	  
		
	              
		foreach ($juegos as $juego) {
			foreach ($juego->goles as $gol) {
			    if ($gol->idEquipo == $juego->idEquipoCasa) {
					 $juegos[$i]->golesCasa++;
				}else {
					 $juegos[$i]->golesVisitantes++;
				}   
			}
			
		    //a este arreglo se le ara un array push a data 
		    $dataSup = array(
			  "nombreEquipoVisitante"=>$juego->visitante->nombre,
			  "urlEquipoVisitante"=>$juego->visitante->fotoPortada->url,
			  "golesEquipoVisitante"=>$juego->golesVisitantes,
			  "nombreEquipoCasa"=>$juego->casa->nombre,
			  "urlEquipoCasa"=>$juego->casa->fotoPortada->url,
			  "golesEquipoCasa"=>$juego->golesCasa,
			  "tiempo"=>$juego->tiempo,
			  "fechaDelJuego"=>$juego->fecha,
			  "liga"=>$juego->visitante->liga,
			   	);			
			//paso los datos de dataSuplementary a data 
			
			array_push($data,$dataSup);  
			
			
			$i++;             
		} 
		
		//este son los datos que se van a requestiar 
		
		header('Cache-Control: no-cache, must-revalidate');
		header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
		header('Content-type: application/json');
		
		echo(json_encode($data));
		
			   
	}
	
	public function actionAll(){
		$juegos = Juegos::model()->with(array(
			'visitante.logo'=>array(
				'alias'=>'v_logo'
			), 
			'casa.logo' => array(
				'alias'=>'c_logo'
			)
		))->findAll();
		
		$juegosJSON = array();
		foreach($juegos as $juego){
			$juegoJSON = array(
				"id"=>$juego->id,
				"equipoCasa"=> array(
					"id" => $juego->casa->id,
					"nombre" => $juego->casa->nombre,
					"urlLogo"=> null,
				),
				"equipoVisitante"=> array(
					"id" => $juego->visitante->id,
					"nombre" => $juego->visitante->nombre,
					"urlLogo"=> null,
				),
				"fecha"=> $juego->fecha,
				"periodo"=> $juego->tiempo
			);
			
			if($juego->casa->logo){
				$juegoJSON["equipoCasa"]["urlLogo"]=$juego->casa->logo->url;
			}
			if($juego->visitante->logo){
				$juegoJSON["equipoVisitante"]["urlLogo"]=$juego->visitante->logo->url;
			}
		
			array_push($juegosJSON, $juegoJSON);
		}

		
		print_r(json_encode($juegosJSON));
	}
	
	public function actionConTorneos(){
	
		if(Yii::app()->request->isPostRequest){
		
			//Yii::import('application.controllers.TorneosController');
			$data = json_decode(file_get_contents('php://input'), true);
			/*$torneoActual = Torneos::model()->mostRecent()->find();
			$torneoElegido = Torneos::model()->find(array('condition'=>'name=:name AND temporada=:temporada AND anio=:anio',
													'params'=>array(':name'=>'prueba',
																	':temporada'=>$torneoActual->temporada,
															':anio'=>$torneoActual->anio)));*/
			$idsTorneos = null;
			if(isset($data['torneos'])){
				$idsTorneos = $data['torneos'];
			}
			//$torneoElegido = Torneos::model()->findByPK($data["torneo_id"]);
			//var_dump($torneoActual);
			//$juegos = array();
			if(!$idsTorneos){
				$torneoActual = Torneos::model()->mostRecent()->find();
				$torneosRecientes = Torneos::model()->findAll(array('condition'=>'temporada=:temporada AND anio=:anio',
													'params'=>array(':temporada'=>$torneoActual->temporada,
																	':anio'=>$torneoActual->anio)));
				foreach($torneosRecientes as $torneo){
					$idsTorneos[]= $torneo->id;
				}
			}
			
			$params = array();
			$condition = "";
			for($i = 1; $i <= count($idsTorneos); $i++){
				if($i == 1){
					$condition = 'torneo_id=:torneo_id'.$i;
				} else {
					$condition = $condition.' OR torneo_id=:torneo_id'.$i;
				}
				$params[':torneo_id'.$i] = $idsTorneos[$i-1];
				/*$juegos = $torneoElegido->juegos(array(
					'visitante.logo'=>array(
						'alias'=>'v_logo'
					), 
					'casa.logo' => array(
						'alias'=>'c_logo'
					),
				));*/
			}
			
			$juegos = array();
			if(count($params)>0){
				$juegos = Juegos::model()->with(array(
					'visitante.logo'=>array(
						'alias'=>'v_logo'
					), 
					'casa.logo' => array(
						'alias'=>'c_logo'
					),
				))->findAll(array(
					'condition' => $condition,
					'params' => $params,
				));
			}
			
			$juegosJSON = array();
			foreach($juegos as $juego){
			
				$golesEquipoVisitante = Goles::model()->count(array('condition'=>'idJuego=:idJuego AND idEquipo=:idEquipo', 
										'params' => array(':idEquipo'=>$juego->idEquipoVisitante,
														':idJuego'=>$juego->id)));
				$golesEquipoCasa = Goles::model()->count(array('condition'=>'idJuego=:idJuego AND idEquipo=:idEquipo', 
										'params' => array(':idEquipo'=>$juego->idEquipoCasa,
														':idJuego'=>$juego->id)));
			
				$juegoJSON = array(
					"id"=>$juego->id,
					"equipoCasa"=> array(
						"id" => $juego->casa->id,
						"nombre" => $juego->casa->nombre,
						"urlLogo"=> null,
						"goles"=>$golesEquipoCasa,
					),
					"equipoVisitante"=> array(
						"id" => $juego->visitante->id,
						"nombre" => $juego->visitante->nombre,
						"urlLogo"=> null,
						"goles"=>$golesEquipoVisitante,
					),
					"fecha"=> $juego->fecha,
					"periodo"=> $juego->tiempo
				);
				
				if($juego->casa->logo){
					$juegoJSON["equipoCasa"]["urlLogo"]=$juego->casa->logo->url;
				}
				if($juego->visitante->logo){
					$juegoJSON["equipoVisitante"]["urlLogo"]=$juego->visitante->logo->url;
				}
			
				array_push($juegosJSON, $juegoJSON);
			}
			
			
			header('Cache-Control: no-cache, must-revalidate');
			//header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
			header('Content-type: application/json');
			print_r(json_encode($juegosJSON));
			//print_r(json_encode((array)$torneoActual->attributes));
		} else {
			throw new CHttpException(400,'Invalid request. Please do not repeat this request again.');
		}
	}
}
