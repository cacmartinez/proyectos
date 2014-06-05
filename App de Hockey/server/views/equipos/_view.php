<?php
/* @var $this EquiposController */
/* @var $data Equipos */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fotoPortada')); ?>:</b>
	<?php echo CHtml::encode($data->fotoPortada); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nombre')); ?>:</b>
	<?php echo CHtml::encode($data->nombre); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('liga')); ?>:</b>
	<?php echo CHtml::encode($data->liga); ?>
	<br />


</div>