<?php
/* @var $this JugadoresController */
/* @var $model Jugadores */

$this->breadcrumbs=array(
	'Jugadores'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Jugadores', 'url'=>array('index')),
	array('label'=>'Create Jugadores', 'url'=>array('create')),
	array('label'=>'Update Jugadores', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Jugadores', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Jugadores', 'url'=>array('admin')),
);
?>

<h1>View Jugadores #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'nombre',
		'idEquipo',
		'idFotoPortada',
		'numero',
		'pocision',
	),
)); ?>
