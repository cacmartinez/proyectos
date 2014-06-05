<?php

class TorneosController extends Controller
{
	public function actionIndex()
	{
		$this->render('index');
	}

	// Uncomment the following methods and override them if needed
	/*
	public function filters()
	{
		// return the filter configuration for this controller, e.g.:
		return array(
			'inlineFilterName',
			array(
				'class'=>'path.to.FilterClass',
				'propertyName'=>'propertyValue',
			),
		);
	}

	public function actions()
	{
		// return external action classes, e.g.:
		return array(
			'action1'=>'path.to.ActionClass',
			'action2'=>array(
				'class'=>'path.to.AnotherActionClass',
				'propertyName'=>'propertyValue',
			),
		);
	}
	*/
	
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
	
	public function actionActuales(){
		//if(Yii::app()->request->isPostRequest){
			$torneoActual = Torneos::model()->mostRecent()->find();
			$torneosRecientes = Torneos::model()->findAll(array('condition'=>'temporada=:temporada AND anio=:anio',
													'params'=>array(':temporada'=>$torneoActual->temporada,
																	':anio'=>$torneoActual->anio)));
			$torneosJSON = array();
			foreach($torneosRecientes as $torneo){
				$torneoJSON = array(
					'id'=>$torneo->id,
					'nombre'=>$torneo->name,
					'complejo'=>$torneo->complejo,
				);
				array_push($torneosJSON, $torneoJSON);
			}
			
			
			header('Cache-Control: no-cache, must-revalidate');
			//header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
			header('Content-type: application/json');
			print_r(json_encode(array("torneos"=>$torneosJSON)));
			return $torneosRecientes;
		/*} else {
			throw new CHttpException(400,'Invalid request. Please do not repeat this request again.');
		}*/
		
	}
}