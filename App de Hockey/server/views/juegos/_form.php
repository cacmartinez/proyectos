<?php
/* @var $this JuegosController */
/* @var $model Juegos */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'juegos-form',
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
		<?php echo $form->labelEx($model,'mbp'); ?>
		<?php echo $form->textField($model,'mbp',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'mbp'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'idEquipoCasa'); ?>
		<?php echo $form->textField($model,'idEquipoCasa'); ?>
		<?php echo $form->error($model,'idEquipoCasa'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'idEquipoVisitante'); ?>
		<?php echo $form->textField($model,'idEquipoVisitante'); ?>
		<?php echo $form->error($model,'idEquipoVisitante'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'idFotoPortada'); ?>
		<?php echo $form->textField($model,'idFotoPortada'); ?>
		<?php echo $form->error($model,'idFotoPortada'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'tiempo'); ?>
		<?php echo $form->textField($model,'tiempo'); ?>
		<?php echo $form->error($model,'tiempo'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->