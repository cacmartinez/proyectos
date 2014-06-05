<?php
/* @var $this GolesController */
/* @var $model Goles */

$this->breadcrumbs=array(
	'Goles'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Goles', 'url'=>array('index')),
	array('label'=>'Create Goles', 'url'=>array('create')),
	array('label'=>'Update Goles', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Goles', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Goles', 'url'=>array('admin')),
);
?>

<h1>View Goles #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'idJugador',
		'idEquipo',
		'idJuego',
		'tiempo',
	),
)); ?>
