<?php
/* @var $this JuegosController */
/* @var $model Juegos */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'id'); ?>
		<?php echo $form->textField($model,'id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'mbp'); ?>
		<?php echo $form->textField($model,'mbp',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'idEquipoCasa'); ?>
		<?php echo $form->textField($model,'idEquipoCasa'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'idEquipoVisitante'); ?>
		<?php echo $form->textField($model,'idEquipoVisitante'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'idFotoPortada'); ?>
		<?php echo $form->textField($model,'idFotoPortada'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'tiempo'); ?>
		<?php echo $form->textField($model,'tiempo'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->