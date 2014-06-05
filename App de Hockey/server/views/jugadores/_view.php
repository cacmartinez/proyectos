<?php
/* @var $this JugadoresController */
/* @var $data Jugadores */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nombre')); ?>:</b>
	<?php echo CHtml::encode($data->nombre); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('idEquipo')); ?>:</b>
	<?php echo CHtml::encode($data->idEquipo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('idFotoPortada')); ?>:</b>
	<?php echo CHtml::encode($data->idFotoPortada); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('numero')); ?>:</b>
	<?php echo CHtml::encode($data->numero); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('pocision')); ?>:</b>
	<?php echo CHtml::encode($data->pocision); ?>
	<br />


</div>