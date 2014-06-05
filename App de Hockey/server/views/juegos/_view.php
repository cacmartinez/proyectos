<?php
/* @var $this JuegosController */
/* @var $data Juegos */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('mbp')); ?>:</b>
	<?php echo CHtml::encode($data->mbp); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('idEquipoCasa')); ?>:</b>
	<?php echo CHtml::encode($data->idEquipoCasa); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('idEquipoVisitante')); ?>:</b>
	<?php echo CHtml::encode($data->idEquipoVisitante); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('idFotoPortada')); ?>:</b>
	<?php echo CHtml::encode($data->idFotoPortada); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tiempo')); ?>:</b>
	<?php echo CHtml::encode($data->tiempo); ?>
	<br />


</div>