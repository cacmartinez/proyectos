<?php
/* @var $this JugadoresController */
/* @var $model Jugadores */

$this->breadcrumbs=array(
	'Jugadores'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Jugadores', 'url'=>array('index')),
	array('label'=>'Manage Jugadores', 'url'=>array('admin')),
);
?>

<h1>Create Jugadores</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>