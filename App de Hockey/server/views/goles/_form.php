<?php
/* @var $this GolesController */
/* @var $model Goles */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'goles-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'id'); ?>
		<?php echo $form->textField($model,'id'); ?>
		<?php echo $form->error($model,'id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'idJugador'); ?>
		<?php echo $form->textField($model,'idJugador'); ?>
		<?php echo $form->error($model,'idJugador'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'idEquipo'); ?>
		<?php echo $form->textField($model,'idEquipo'); ?>
		<?php echo $form->error($model,'idEquipo'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'idJuego'); ?>
		<?php echo $form->textField($model,'idJuego'); ?>
		<?php echo $form->error($model,'idJuego'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'tiempo'); ?>
		<?php echo $form->textField($model,'tiempo',array('size'=>10,'maxlength'=>10)); ?>
		<?php echo $form->error($model,'tiempo'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->