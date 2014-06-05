<?php
/* @var $this JuegosController */
/* @var $model Juegos */

$this->breadcrumbs=array(
	'Juegoses'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Juegos', 'url'=>array('index')),
	array('label'=>'Manage Juegos', 'url'=>array('admin')),
);
?>

<h1>Create Juegos</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>