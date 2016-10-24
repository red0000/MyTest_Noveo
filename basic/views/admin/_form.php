<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use budyaga\cropper\Widget;
use budyaga\users\models\User;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;
use app\models\Groups;

/* @var $this yii\web\View */
/* @var $model budyaga\users\models\User */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="user-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'username')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'email')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'photo')->widget(Widget::className(), [
        'uploadUrl' => Url::toRoute('/user/user/uploadPhoto'),
    ]) ?>

    <?= $form->field($model, 'sex')->dropDownList(User::getSexArray()); ?>

    <?= $form->field($model, 'status')->dropDownList(User::getStatusArray()); ?>
	
    <?= $form->field($model, 'group_id')->dropDownList(ArrayHelper::map(Groups::find()->all(), 'id', 'groupname')); ?>
	

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('users', 'СОЗДАТЬ') : Yii::t('users', 'ОБНОВИТЬ'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
