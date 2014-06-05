<?php
/* @var $this GolesController */
/* @var $model Goles */
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
		<?php echo $form->label($model,'idJugador'); ?>
		<?php echo $form->textField($model,'idJugador'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'idEquipo'); ?>
		<?php echo $form->textField($model,'idEquipo'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'idJuego'); ?>
		<?php echo $form->textField($model,'idJuego'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'tiempo'); ?>
		<?php echo $form->textField($model,'tiempo',array('size'=>10,'maxlength'=>10)); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->