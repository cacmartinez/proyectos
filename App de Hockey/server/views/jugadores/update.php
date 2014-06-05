<?php
/* @var $this JugadoresController */
/* @var $model Jugadores */

$this->breadcrumbs=array(
	'Jugadores'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Jugadores', 'url'=>array('index')),
	array('label'=>'Create Jugadores', 'url'=>array('create')),
	array('label'=>'View Jugadores', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Jugadores', 'url'=>array('admin')),
);
?>

<h1>Update Jugadores <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>