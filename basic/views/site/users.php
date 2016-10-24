<?php
use yii\widgets\LinkPager;
?>
<h1>Пользователи:</h1>

<p>Последний раз Вы смотрили профиль: <a href="<?=Yii::$app->urlManager->createUrl(['site/user', 'name' => $name]) ?>"><?=$name?></a>.</p>
<ul>
<?php foreach ($users as $user) { ?>
	<li><b><a href="<?=Yii::$app->urlManager->createUrl(['site/user', 'name' => $user->name])?>"><?=$user->name?></a> <?=$user->sec_name?> <?=$user->fath_name?></b> <?=$user->email?></li>	
<?php } ?>
</ul>

<?=LinkPager::widget(['pagination' => $pagination]) ?>