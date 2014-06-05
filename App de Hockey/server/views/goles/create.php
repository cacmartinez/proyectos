<?php
/* @var $this GolesController */
/* @var $model Goles */

$this->breadcrumbs=array(
	'Goles'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Goles', 'url'=>array('index')),
	array('label'=>'Manage Goles', 'url'=>array('admin')),
);
?>

<h1>Create Goles</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>