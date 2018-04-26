<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Payment */
/* @var $client app\models\Client */

$this->title = 'Create Payment';
$this->params['breadcrumbs'][] = ['label' => 'Clients', 'url' => ['client/index']];
$this->params['breadcrumbs'][] = ['label' => $client->getPrimaryKey(), 'url' => ['client/view', 'id' => $client->getPrimaryKey()]];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="payment-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
