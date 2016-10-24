<?php
namespace app\controllers;
 
use Yii;
use yii\web\Controller;
use app\models\Users;
use yii\data\Pagination;
 
class UsersController extends Controller
{
    public function actionView()
	{
		$users = Users::find();
		
		$pagination = new Pagination([
			'defaultPageSize' => 10,
			'totalCount' => $users->count()
		]);
		
		$users = $users->offset($pagination->offset)
			->limit($pagination->limit)
			->all();
			
		$cookies = Yii::$app->request->cookies;
		
		
		return $this->render('users', [
			'users' => $users,
			'pagination' =>$pagination,
//			'name' => $cookies->getValue('name')
			'name' => Yii::$app->session->get('name')
		]);
	}
}
?>