<?php
/* @var $this JuegosController */
/* @var $model Juegos */

$this->breadcrumbs=array(
	'Juegoses'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Juegos', 'url'=>array('index')),
	array('label'=>'Create Juegos', 'url'=>array('create')),
	array('label'=>'View Juegos', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Juegos', 'url'=>array('admin')),
);
?>

<h1>Update Juegos <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>