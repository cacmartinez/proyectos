<?php
/* @var $this GolesController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Goles',
);

$this->menu=array(
	array('label'=>'Create Goles', 'url'=>array('create')),
	array('label'=>'Manage Goles', 'url'=>array('admin')),
);
?>

<h1>Goles</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
