<?php
/* @var $this GolesController */
/* @var $model Goles */

$this->breadcrumbs=array(
	'Goles'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Goles', 'url'=>array('index')),
	array('label'=>'Create Goles', 'url'=>array('create')),
	array('label'=>'View Goles', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Goles', 'url'=>array('admin')),
);
?>

<h1>Update Goles <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>