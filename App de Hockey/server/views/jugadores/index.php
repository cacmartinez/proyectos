<?php
/* @var $this JugadoresController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Jugadores',
);

$this->menu=array(
	array('label'=>'Create Jugadores', 'url'=>array('create')),
	array('label'=>'Manage Jugadores', 'url'=>array('admin')),
);
?>

<h1>Jugadores</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
