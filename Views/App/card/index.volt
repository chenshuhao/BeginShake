<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>代理商中心</title>
	<script src="http://lib.sinaapp.com/js/jquery/1.9.1/jquery-1.9.1.min.js"></script>
</head>

<body>
	<div class="wrap">
		<div class="containermy clearfixmy">
			<div id="content" class="right" >

				<div class="margin-l15">
					<h2>卡券列表</h2>
					<table>
						<tr>
							<th>id</th>
							<th>子商户id</th>
							<th>卡券ID</th>
							<th>卡卷类型</th>
							<th>logo地址</th>
							<th>Code展示类</th>
							<th>商户名字</th>
							<th>卡券名</th>
							<th>券名</th>
							<th>券颜色</th>
							<th>卡券使用提醒</th>
							<th>卡券使用说明</th>
							<th>卡券库存数量</th>
							<th>开始时间</th>
							<th>结束时间</th>
							<th>每人可领券的数量</th>
							<th>卡券领取页面是否可分享</th>
							<th>卡券是否可转赠</th>
							<th>团购详情</th>
							<th>起用金额</th>
							<th>减免金额</th>
							<th>打折额度</th>
							<th>礼品的名称</th>
							<th>优惠详情</th>
							<th>创建时间</th>
							<th>操作</th>
						</tr>
						{% for cards in card %}
						<tr>
							<td>{{ cards.id|e }}</td>
							<td>{{ cards.sub_merchant_info|e }}</td>
							<td>{{ cards.card_id|e }}</td>
							<td>{{ cards.card_type|e }}</td>
							<td><img src="{{ cards.logo_url|e }}"></td>
							<td>{{ cards.code_type|e }}</td>
							<td>{{ cards.brand_name|e }}</td>
							<td>{{ cards.title|e }}</td>
							<td>{{ cards.sub_title|e }}</td>
							<td>{{ cards.color|e }}</td>
							<td>{{ cards.notice|e }}</td>
							<td>{{ cards.description|e }}</td>
							<td><?php
							$info = json_decode($cards->sku,TRUE);
							echo $info['quantity'];
							?></td>
							<td><?php
							$info = json_decode($cards->date_info,TRUE);
							echo date('Y-m-d H:i:s', $info['begin_timestamp']);
							?></td>
							<td><?php
							$info = json_decode($cards->date_info,TRUE);
							echo date('Y-m-d H:i:s', $info['end_timestamp']);
							?></td>
							<td>{{ cards.get_limit|e }}</td>
							<td>{{ cards.can_share|e }}</td>
							<td>{{ cards.can_give_friend|e }}</td>
							<td>{{ cards.deal_detail|e }}</td>
							<td>{{ cards.least_cost|e }}</td>
							<td>{{ cards.reduce_cost|e }}</td>
							<td>{{ cards.discount|e }}</td>
							<td>{{ cards.gift|e }}</td>
							<td>{{ cards.default_detail|e }}</td>
							<td><?php
							$info = json_decode($cards->create_time,TRUE);
							echo date('Y-m-d H:i:s', $info);
							?></td>
							<td><a href="update?id={{ cards.id|e }}">修改</a> | <a href="cardDelete?id={{ cards.id|e }}">删除</a></td>
						</tr>
						{% endfor %}
					</table>
				</div>
			</div>
		</div>

</body>
	</html>