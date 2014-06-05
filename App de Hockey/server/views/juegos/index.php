<?php
/* @var $this JuegosController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Juegoses',
);

$this->menu=array(
	array('label'=>'Create Juegos', 'url'=>array('create')),
	array('label'=>'Manage Juegos', 'url'=>array('admin')),
);
?>

<h1>Juegoses</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>      


<?php foreach ($juegos as $juego) {
	var_dump($juego->visitante->nombre);   
	var_dump($juego->visitante->fotoPortada0->url);
	var_dump($juego->golesVisitantes);
	var_dump($juego->casa->nombre); 
	var_dump($juego->casa->fotoPortada0->url);
	var_dump($juego->golesCasa);  
	
} ?>     

<?php var_dump(json_encode($data)) ?>
