<?php
/* @var $this GolesController */
/* @var $data Goles */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('idJugador')); ?>:</b>
	<?php echo CHtml::encode($data->idJugador); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('idEquipo')); ?>:</b>
	<?php echo CHtml::encode($data->idEquipo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('idJuego')); ?>:</b>
	<?php echo CHtml::encode($data->idJuego); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tiempo')); ?>:</b>
	<?php echo CHtml::encode($data->tiempo); ?>
	<br />


</div>