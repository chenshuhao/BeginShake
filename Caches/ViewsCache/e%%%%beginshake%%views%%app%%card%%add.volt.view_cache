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
					<h2>创建卡券</h2>
					<blockquote>
						<p class="font14 darkcyan">
							如果您没有设备,可以通过左上角的申请按钮申请设备。
							<br>
							设备需要第一次进行激活，激活完的设备才可以和页面进行绑定哦！
							<br>如果您还没有设置页面可以去右侧的页面选项卡中进行设置。</p>
					</blockquote>

					<!--select-->
					<div class="form-group col-sm-8">
						<select class="form-control" name="cardtype" id="cardtype" onchange="tt()">
							<option selected value="">请选择创建卡券类型</option>
							<option value="tuan">团购券</option>
							<option value="dai">代金券</option>
							<option value="zhe">折扣券</option>
							<option value="li">礼品券</option>
							<option value="you">优惠券</option>
						</select>
					</div>
					<!-- tuan-->
					<div id="biao" class="col-sm-8">
						<div class="tuan" style="display: none">
							<form action="/App/Card/cardSave" method="post" enctype="multipart/form-data">
								<input type="hidden" name="card_type" value="GROUPON" >

								<div class="form-group ">
									<label for="logo">上传卡券LOGO：</label>
									<input type="file" name="logo" id="logo" >
									<p class="help-block">上传的图片限制文件大小限制1MB，像素为300*300，仅支持JPG、PNG格式。</p>
								</div>

								<div class="form-group ">
									<label for="logo">选取卡券背景颜色：</label>
									<select class="form-control"  name="color" onchange="selectColor(this)">
										<option value="" selected>请选择卡券颜色</option>
										<option value="Color010" style="background: #63b359;"></option>
										<option value="Color020" style="background: #2c9f67;"></option>
										<option value="Color030" style="background: #509fc9;"></option>
										<option value="Color040" style="background: #5885cf;"></option>
										<option value="Color050" style="background: #9062c0;"></option>
										<option value="Color060" style="background: #d09a45;"></option>
										<option value="Color070" style="background: #e4b138;"></option>
										<option value="Color080" style="background: #ee903c;"></option>
										<option value="Color081" style="background: #f08500;"></option>
										<option value="Color082" style="background: #a9d92d;"></option>
										<option value="Color090" style="background: #dd6549;"></option>
										<option value="Color100" style="background: #cc463d;"></option>
										<option value="Color101" style="background: #cf3e36;"></option>
										<option value="Color102" style="background: #5E6671;"></option>
									</select>
								</div>

								<div class="form-group ">
									<label for="brand_name">商户名字：</label>
									<input max-in='12' type="text" class=" form-control " id="brand_name" name="brand_name" placeholder="">
									<span>
										<a>0</a>
										/12
									</span>
									<p class="help-block">字数上限为12个汉字。</p>
								</div>

								<div class="form-group ">
									<label for="brand_name">团购券显示方式：</label>
									<select class="form-control"  name="code_type">
										<option value="CODE_TYPE_TEXT">文本</option>
										<option value="CODE_TYPE_BARCODE">一维码</option>
										<option value="CODE_TYPE_QRCODE">二维码</option>
										<option value="CODE_TYPE_ONLY_QRCODE">二维码无code显示</option>
										<option value="CODE_TYPE_ONLY_BARCODE">一维码无code显示</option>
									</select>
								</div>

								<div class="form-group ">
									<label for="title">卡券名：</label>
									<input max-in='9' type="text" class=" form-control " id="title" name="title" placeholder="">
									<span>
										<a>0</a>
										/9
									</span>
									<p class="help-block">字数上限为9个汉字。(建议涵盖卡券属性、服务及金额)。</p>
								</div>

								<div class="form-group ">
									<label for="sub_title">券名：</label>
									<input max-in='18' type="text" class=" form-control " id="sub_title" name="sub_title" placeholder="">
									<span>
										<a>0</a>
										/18
									</span>
									<p class="help-block">券名，字数上限为18个汉字。</p>
								</div>

								<div class="form-group ">
									<label for="notice">卡券使用提醒：</label>
									<input max-in='16' type="text" class=" form-control " id="notice" name="notice" placeholder="">
									<span>
										<a>0</a>
										/16
									</span>
									<p class="help-block">字数上限为16个汉字。</p>
								</div>

								<div class="form-group ">
									<label for="quantity">卡券库存的数量：</label>
									<input  type="text" class=" form-control " id="quantity" name="quantity" placeholder="">
									<p class="help-block">上限为100000000。</p>
								</div>

								<div class="form-group ">
									<label for="description">申请理由：</label>
									<textarea  max-in='1024' class="form-control" id="description" name="description" rows="3"></textarea>
									<span>
										<a>0</a>
										/1024
									</span>
									<p class="help-block">字数上限为1024个汉字。</p>
								</div>

								<div class="form-group ">
									<label for="begin_timestamp">开始时间：</label>
									<div class="input-group date form_datetime col-md-5" data-date="1979-09-16T05:25:07Z" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dtp_input1">
										<input class="form-control" size="16" type="text" value="" id="begin_timestamp" name="begin_timestamp" >
										<span class="input-group-addon">
											<span class="glyphicon glyphicon-th"></span>
										</span>
									</div>
									<p class="help-block">起用时间。</p>
								</div>

								<div class="form-group ">
									<label for="end_timestamp">结束时间：</label>
									<div class="input-group date form_datetime col-md-5" data-date="1979-09-16T05:25:07Z" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dtp_input1">
										<input class="form-control" size="16" type="text" value="" id="end_timestamp" name="end_timestamp" >
										<span class="input-group-addon">
											<span class="glyphicon glyphicon-th"></span>
										</span>
									</div>
									<p class="help-block">结束时间。</p>
								</div>

								<div class="form-group ">
									<label for="deal_detail">团购详情：</label>
									<textarea  max-in='24' class="form-control" id="deal_detail" name="deal_detail" rows="3"></textarea>
									<span>
										<a>0</a>
										/24
									</span>
									<p class="help-block">字数上限为24个汉字。</p>
								</div>

								<p class='hr'>非必填：</p>

								<div class="form-group ">
									<label for="service_phone">客服电话：</label>
									<input  type="text" class=" form-control " id="service_phone" name="service_phone" placeholder=""></div>

								<div class="form-group ">
									<label for="get_limit">每人可领券的数量：</label>
									<input  type="text" class=" form-control " id="get_limit" name="get_limit" placeholder="">
									<p class="help-block">不填写默认为50。</p>
								</div>

								<div class="form-group ">
									<label for="can_share">卡券领取页面是否可分享：</label>
									<select class="form-control"  name="can_share" id="can_share">
										<option value="true">是</option>
										<option value="false">否</option>
									</select>
								</div>

								<div class="form-group ">
									<label for="can_give_friend">卡券是否可转赠：</label>
									<select class="form-control"  name="can_give_friend" id="can_give_friend">
										<option value="true">是</option>
										<option value="false">否</option>
									</select>
								</div>

								<input type="submit" class="btn btn-warning" value="创建卡券"></form>
						</div>

						<!--dai -->
						<div class="dai" style="display: none">
							<form action="/App/Card/cardSave" method="post" enctype="multipart/form-data">
								<h3>代金券</h3>
								<input type="hidden" name="card_type" value="CASH" >
								<div class="form-group ">
									<label for="logo">上传卡券LOGO：</label>
									<input type="file" name="logo" id="logo" >
									<p class="help-block">上传的图片限制文件大小限制1MB，像素为300*300，仅支持JPG、PNG格式。</p>
								</div>

								<div class="form-group ">
									<label for="logo">选取卡券背景颜色：</label>
									<select class="form-control"  name="color" onchange="selectColor(this)">
										<option value="" selected>请选择卡券颜色</option>
										<option value="Color010" style="background: #63b359;"></option>
										<option value="Color020" style="background: #2c9f67;"></option>
										<option value="Color030" style="background: #509fc9;"></option>
										<option value="Color040" style="background: #5885cf;"></option>
										<option value="Color050" style="background: #9062c0;"></option>
										<option value="Color060" style="background: #d09a45;"></option>
										<option value="Color070" style="background: #e4b138;"></option>
										<option value="Color080" style="background: #ee903c;"></option>
										<option value="Color081" style="background: #f08500;"></option>
										<option value="Color082" style="background: #a9d92d;"></option>
										<option value="Color090" style="background: #dd6549;"></option>
										<option value="Color100" style="background: #cc463d;"></option>
										<option value="Color101" style="background: #cf3e36;"></option>
										<option value="Color102" style="background: #5E6671;"></option>
									</select>
								</div>

								<div class="form-group ">
									<label for="brand_name">商户名字：</label>
									<input max-in='12' type="text" class=" form-control " id="brand_name" name="brand_name" placeholder="">
									<span>
										<a>0</a>
										/12
									</span>
									<p class="help-block">字数上限为12个汉字。</p>
								</div>

								<div class="form-group ">
									<label for="brand_name">团购券显示方式：</label>
									<select class="form-control"  name="code_type">
										<option value="CODE_TYPE_TEXT">文本</option>
										<option value="CODE_TYPE_BARCODE">一维码</option>
										<option value="CODE_TYPE_QRCODE">二维码</option>
										<option value="CODE_TYPE_ONLY_QRCODE">二维码无code显示</option>
										<option value="CODE_TYPE_ONLY_BARCODE">一维码无code显示</option>
									</select>
								</div>

								<div class="form-group ">
									<label for="title">卡券名：</label>
									<input max-in='9' type="text" class=" form-control " id="title" name="title" placeholder="">
									<span>
										<a>0</a>
										/9
									</span>
									<p class="help-block">字数上限为9个汉字。(建议涵盖卡券属性、服务及金额)。</p>
								</div>

								<div class="form-group ">
									<label for="sub_title">券名：</label>
									<input max-in='18' type="text" class=" form-control " id="sub_title" name="sub_title" placeholder="">
									<span>
										<a>0</a>
										/18
									</span>
									<p class="help-block">券名，字数上限为18个汉字。</p>
								</div>

								<div class="form-group ">
									<label for="notice">卡券使用提醒：</label>
									<input max-in='16' type="text" class=" form-control " id="notice" name="notice" placeholder="">
									<span>
										<a>0</a>
										/16
									</span>
									<p class="help-block">字数上限为16个汉字。</p>
								</div>

								<div class="form-group ">
									<label for="quantity">卡券库存的数量：</label>
									<input  type="text" class=" form-control " id="quantity" name="quantity" placeholder="">
									<p class="help-block">上限为100000000。</p>
								</div>

								<div class="form-group ">
									<label for="description">申请理由：</label>
									<textarea  max-in='1024' class="form-control" id="description" name="description" rows="3"></textarea>
									<span>
										<a>0</a>
										/1024
									</span>
									<p class="help-block">字数上限为1024个汉字。</p>
								</div>

								<div class="form-group ">
									<label for="begin_timestamp">开始时间：</label>
									<div class="input-group date form_datetime col-md-5" data-date="1979-09-16T05:25:07Z" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dtp_input1">
										<input class="form-control" size="16" type="text" value="" readonly id="begin_timestamp" name="begin_timestamp" >
										<span class="input-group-addon">
											<span class="glyphicon glyphicon-th"></span>
										</span>
									</div>
									<p class="help-block">起用时间。</p>
								</div>

								<div class="form-group ">
									<label for="end_timestamp">结束时间：</label>
									<div class="input-group date form_datetime col-md-5" data-date="1979-09-16T05:25:07Z" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dtp_input1">
										<input class="form-control" size="16" type="text" value="" readonly id="end_timestamp" name="end_timestamp" >
										<span class="input-group-addon">
											<span class="glyphicon glyphicon-th"></span>
										</span>
									</div>
									<p class="help-block">结束时间。</p>
								</div>

								<div class="form-group ">
									<label for="least_cost">起用金额：</label>
									<input  type="text" class=" form-control " id="least_cost" name="least_cost" placeholder="">
									<p class="help-block">代金券专用，表示起用金额（单位为分）,如果无起用门槛则填0。</p>
								</div>

								<div class="form-group ">
									<label for="reduce_cost">减免金额：</label>
									<input  type="text" class=" form-control " id="reduce_cost" name="reduce_cost" placeholder="">
									<p class="help-block">代金券专用，表示减免金额。（单位为分）</p>
								</div>

								<p class='hr'>非必填：</p>

								<div class="form-group ">
									<label for="service_phone">客服电话：</label>
									<input  type="text" class=" form-control " id="service_phone" name="service_phone" placeholder=""></div>

								<div class="form-group ">
									<label for="get_limit">每人可领券的数量：</label>
									<input  type="text" class=" form-control " id="get_limit" name="get_limit" placeholder="">
									<p class="help-block">不填写默认为50。</p>
								</div>

								<div class="form-group ">
									<label for="can_share">卡券领取页面是否可分享：</label>
									<select class="form-control"  name="can_share" id="can_share">
										<option value="true">是</option>
										<option value="false">否</option>
									</select>
								</div>

								<div class="form-group ">
									<label for="can_give_friend">卡券是否可转赠：</label>
									<select class="form-control"  name="can_give_friend" id="can_give_friend">
										<option value="true">是</option>
										<option value="false">否</option>
									</select>
								</div>

								<div class="form-group ">
									<label for="deal_detail">团购详情：</label>
									<textarea  max-in='24' class="form-control" id="deal_detail" name="deal_detail" rows="3"></textarea>
									<span>
										<a>0</a>
										/24
									</span>
									<p class="help-block">字数上限为24个汉字。</p>
								</div>
								<input type="submit" class="btn btn-warning" value="创建卡券"></form>
						</div>
						<!-- ze-->
						<div class="zhe" style="display: none">
							<form action="/App/Card/cardSave" method="post" enctype="multipart/form-data">
								<h3>折扣券</h3>
								<input type="hidden" name="card_type" value="DISCOUNT" >
								<div class="form-group ">
									<label for="logo">上传卡券LOGO：</label>
									<input type="file" name="logo" id="logo" >
									<p class="help-block">上传的图片限制文件大小限制1MB，像素为300*300，仅支持JPG、PNG格式。</p>
								</div>

								<div class="form-group ">
									<label for="logo">选取卡券背景颜色：</label>
									<select class="form-control"  name="color" onchange="selectColor(this)">
										<option value="" selected>请选择卡券颜色</option>
										<option value="Color010" style="background: #63b359;"></option>
										<option value="Color020" style="background: #2c9f67;"></option>
										<option value="Color030" style="background: #509fc9;"></option>
										<option value="Color040" style="background: #5885cf;"></option>
										<option value="Color050" style="background: #9062c0;"></option>
										<option value="Color060" style="background: #d09a45;"></option>
										<option value="Color070" style="background: #e4b138;"></option>
										<option value="Color080" style="background: #ee903c;"></option>
										<option value="Color081" style="background: #f08500;"></option>
										<option value="Color082" style="background: #a9d92d;"></option>
										<option value="Color090" style="background: #dd6549;"></option>
										<option value="Color100" style="background: #cc463d;"></option>
										<option value="Color101" style="background: #cf3e36;"></option>
										<option value="Color102" style="background: #5E6671;"></option>
									</select>
								</div>

								<div class="form-group ">
									<label for="brand_name">商户名字：</label>
									<input max-in='12' type="text" class=" form-control " id="brand_name" name="brand_name" placeholder="">
									<span>
										<a>0</a>
										/12
									</span>
									<p class="help-block">字数上限为12个汉字。</p>
								</div>

								<div class="form-group ">
									<label for="brand_name">团购券显示方式：</label>
									<select class="form-control"  name="code_type">
										<option value="CODE_TYPE_TEXT">文本</option>
										<option value="CODE_TYPE_BARCODE">一维码</option>
										<option value="CODE_TYPE_QRCODE">二维码</option>
										<option value="CODE_TYPE_ONLY_QRCODE">二维码无code显示</option>
										<option value="CODE_TYPE_ONLY_BARCODE">一维码无code显示</option>
									</select>
								</div>

								<div class="form-group ">
									<label for="title">卡券名：</label>
									<input max-in='9' type="text" class=" form-control " id="title" name="title" placeholder="">
									<span>
										<a>0</a>
										/9
									</span>
									<p class="help-block">字数上限为9个汉字。(建议涵盖卡券属性、服务及金额)。</p>
								</div>

								<div class="form-group ">
									<label for="sub_title">券名：</label>
									<input max-in='18' type="text" class=" form-control " id="sub_title" name="sub_title" placeholder="">
									<span>
										<a>0</a>
										/18
									</span>
									<p class="help-block">券名，字数上限为18个汉字。</p>
								</div>

								<div class="form-group ">
									<label for="notice">卡券使用提醒：</label>
									<input max-in='16' type="text" class=" form-control " id="notice" name="notice" placeholder="">
									<span>
										<a>0</a>
										/16
									</span>
									<p class="help-block">字数上限为16个汉字。</p>
								</div>

								<div class="form-group ">
									<label for="quantity">卡券库存的数量：</label>
									<input  type="text" class=" form-control " id="quantity" name="quantity" placeholder="">
									<p class="help-block">上限为100000000。</p>
								</div>

								<div class="form-group ">
									<label for="description">申请理由：</label>
									<textarea  max-in='1024' class="form-control" id="description" name="description" rows="3"></textarea>
									<span>
										<a>0</a>
										/1024
									</span>
									<p class="help-block">字数上限为1024个汉字。</p>
								</div>

								<div class="form-group ">
									<label for="begin_timestamp">开始时间：</label>
									<div class="input-group date form_datetime col-md-5" data-date="1979-09-16T05:25:07Z" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dtp_input1">
										<input class="form-control" size="16" type="text" value="" readonly id="begin_timestamp" name="begin_timestamp" >
										<span class="input-group-addon">
											<span class="glyphicon glyphicon-th"></span>
										</span>
									</div>
									<p class="help-block">起用时间。</p>
								</div>

								<div class="form-group ">
									<label for="end_timestamp">结束时间：</label>
									<div class="input-group date form_datetime col-md-5" data-date="1979-09-16T05:25:07Z" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dtp_input1">
										<input class="form-control" size="16" type="text" value="" readonly id="end_timestamp" name="end_timestamp" >
										<span class="input-group-addon">
											<span class="glyphicon glyphicon-th"></span>
										</span>
									</div>
									<p class="help-block">结束时间。</p>
								</div>

								<div class="form-group ">
									<label for="discount">打折额度：</label>
									<input  type="text" class=" form-control " id="discount" name="discount" placeholder="">
									<p class="help-block">折扣券专用，表示打折额度（百分比）。填30就是七折。</p>
								</div>

								<p class='hr'>非必填：</p>

								<div class="form-group ">
									<label for="service_phone">客服电话：</label>
									<input  type="text" class=" form-control " id="service_phone" name="service_phone" placeholder=""></div>

								<div class="form-group ">
									<label for="get_limit">每人可领券的数量：</label>
									<input  type="text" class=" form-control " id="get_limit" name="get_limit" placeholder="">
									<p class="help-block">不填写默认为50。</p>
								</div>

								<div class="form-group ">
									<label for="can_share">卡券领取页面是否可分享：</label>
									<select class="form-control"  name="can_share" id="can_share">
										<option value="true">是</option>
										<option value="false">否</option>
									</select>
								</div>

								<div class="form-group ">
									<label for="can_give_friend">卡券是否可转赠：</label>
									<select class="form-control"  name="can_give_friend" id="can_give_friend">
										<option value="true">是</option>
										<option value="false">否</option>
									</select>
								</div>

								<div class="form-group ">
									<label for="deal_detail">团购详情：</label>
									<textarea  max-in='24' class="form-control" id="deal_detail" name="deal_detail" rows="3"></textarea>
									<span>
										<a>0</a>
										/24
									</span>
									<p class="help-block">字数上限为24个汉字。</p>
								</div>
								<input type="submit" class="btn btn-warning" value="创建卡券"></form>
						</div>

						<!-- li-->
						<div class="li" style="display: none">
							<form action="/App/Card/cardSave" method="post" enctype="multipart/form-data">
								<h3>礼品券</h3>
								<input type="hidden" name="card_type" value="GIFT" >
								<div class="form-group ">
									<label for="logo">上传卡券LOGO：</label>
									<input type="file" name="logo" id="logo" >
									<p class="help-block">上传的图片限制文件大小限制1MB，像素为300*300，仅支持JPG、PNG格式。</p>
								</div>

								<div class="form-group ">
									<label for="logo">选取卡券背景颜色：</label>
									<select class="form-control"  name="color" onchange="selectColor(this)">
										<option value="" selected>请选择卡券颜色</option>
										<option value="Color010" style="background: #63b359;"></option>
										<option value="Color020" style="background: #2c9f67;"></option>
										<option value="Color030" style="background: #509fc9;"></option>
										<option value="Color040" style="background: #5885cf;"></option>
										<option value="Color050" style="background: #9062c0;"></option>
										<option value="Color060" style="background: #d09a45;"></option>
										<option value="Color070" style="background: #e4b138;"></option>
										<option value="Color080" style="background: #ee903c;"></option>
										<option value="Color081" style="background: #f08500;"></option>
										<option value="Color082" style="background: #a9d92d;"></option>
										<option value="Color090" style="background: #dd6549;"></option>
										<option value="Color100" style="background: #cc463d;"></option>
										<option value="Color101" style="background: #cf3e36;"></option>
										<option value="Color102" style="background: #5E6671;"></option>
									</select>
								</div>

								<div class="form-group ">
									<label for="brand_name">商户名字：</label>
									<input max-in='12' type="text" class=" form-control " id="brand_name" name="brand_name" placeholder="">
									<span>
										<a>0</a>
										/12
									</span>
									<p class="help-block">字数上限为12个汉字。</p>
								</div>

								<div class="form-group ">
									<label for="brand_name">团购券显示方式：</label>
									<select class="form-control"  name="code_type">
										<option value="CODE_TYPE_TEXT">文本</option>
										<option value="CODE_TYPE_BARCODE">一维码</option>
										<option value="CODE_TYPE_QRCODE">二维码</option>
										<option value="CODE_TYPE_ONLY_QRCODE">二维码无code显示</option>
										<option value="CODE_TYPE_ONLY_BARCODE">一维码无code显示</option>
									</select>
								</div>

								<div class="form-group ">
									<label for="title">卡券名：</label>
									<input max-in='9' type="text" class=" form-control " id="title" name="title" placeholder="">
									<span>
										<a>0</a>
										/9
									</span>
									<p class="help-block">字数上限为9个汉字。(建议涵盖卡券属性、服务及金额)。</p>
								</div>

								<div class="form-group ">
									<label for="sub_title">券名：</label>
									<input max-in='18' type="text" class=" form-control " id="sub_title" name="sub_title" placeholder="">
									<span>
										<a>0</a>
										/18
									</span>
									<p class="help-block">券名，字数上限为18个汉字。</p>
								</div>

								<div class="form-group ">
									<label for="notice">卡券使用提醒：</label>
									<input max-in='16' type="text" class=" form-control " id="notice" name="notice" placeholder="">
									<span>
										<a>0</a>
										/16
									</span>
									<p class="help-block">字数上限为16个汉字。</p>
								</div>

								<div class="form-group ">
									<label for="quantity">卡券库存的数量：</label>
									<input  type="text" class=" form-control " id="quantity" name="quantity" placeholder="">
									<p class="help-block">上限为100000000。</p>
								</div>

								<div class="form-group ">
									<label for="description">申请理由：</label>
									<textarea  max-in='1024' class="form-control" id="description" name="description" rows="3"></textarea>
									<span>
										<a>0</a>
										/1024
									</span>
									<p class="help-block">字数上限为1024个汉字。</p>
								</div>

								<div class="form-group ">
									<label for="begin_timestamp">开始时间：</label>
									<div class="input-group date form_datetime col-md-5" data-date="1979-09-16T05:25:07Z" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dtp_input1">
										<input class="form-control" size="16" type="text" value="" readonly id="begin_timestamp" name="begin_timestamp" >
										<span class="input-group-addon">
											<span class="glyphicon glyphicon-th"></span>
										</span>
									</div>
									<p class="help-block">起用时间。</p>
								</div>

								<div class="form-group ">
									<label for="end_timestamp">结束时间：</label>
									<div class="input-group date form_datetime col-md-5" data-date="1979-09-16T05:25:07Z" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dtp_input1">
										<input class="form-control" size="16" type="text" value="" readonly id="end_timestamp" name="end_timestamp" >
										<span class="input-group-addon">
											<span class="glyphicon glyphicon-th"></span>
										</span>
									</div>
									<p class="help-block">结束时间。</p>
								</div>
								<div class="form-group ">
									<label for="gift">填写礼品的名称：</label>
									<input  type="text" class=" form-control " id="gift" name="gift" placeholder="">
									<p class="help-block">礼品券专用，填写礼品的名称。</p>
								</div>

								<p class='hr'>非必填：</p>

								<div class="form-group ">
									<label for="service_phone">客服电话：</label>
									<input  type="text" class=" form-control " id="service_phone" name="service_phone" placeholder=""></div>

								<div class="form-group ">
									<label for="get_limit">每人可领券的数量：</label>
									<input  type="text" class=" form-control " id="get_limit" name="get_limit" placeholder="">
									<p class="help-block">不填写默认为50。</p>
								</div>

								<div class="form-group ">
									<label for="can_share">卡券领取页面是否可分享：</label>
									<select class="form-control"  name="can_share" id="can_share">
										<option value="true">是</option>
										<option value="false">否</option>
									</select>
								</div>

								<div class="form-group ">
									<label for="can_give_friend">卡券是否可转赠：</label>
									<select class="form-control"  name="can_give_friend" id="can_give_friend">
										<option value="true">是</option>
										<option value="false">否</option>
									</select>
								</div>

								<div class="form-group ">
									<label for="deal_detail">团购详情：</label>
									<textarea  max-in='24' class="form-control" id="deal_detail" name="deal_detail" rows="3"></textarea>
									<span>
										<a>0</a>
										/24
									</span>
									<p class="help-block">字数上限为24个汉字。</p>
								</div>
								<input type="submit" class="btn btn-warning" value="创建卡券"></form>
						</div>
						<!-- you-->
						<div class="you" style="display: none">
							<form action="/App/Card/cardSave" method="post" enctype="multipart/form-data">
								<h3>优惠券</h3>
								<input type="hidden" name="card_type" value="GENERAL_COUPON" >
								<div class="form-group ">
									<label for="logo">上传卡券LOGO：</label>
									<input type="file" name="logo" id="logo" >
									<p class="help-block">上传的图片限制文件大小限制1MB，像素为300*300，仅支持JPG、PNG格式。</p>
								</div>

								<div class="form-group ">
									<label for="logo">选取卡券背景颜色：</label>
									<select class="form-control"  name="color" onchange="selectColor(this)">
										<option value="" selected>请选择卡券颜色</option>
										<option value="Color010" style="background: #63b359;"></option>
										<option value="Color020" style="background: #2c9f67;"></option>
										<option value="Color030" style="background: #509fc9;"></option>
										<option value="Color040" style="background: #5885cf;"></option>
										<option value="Color050" style="background: #9062c0;"></option>
										<option value="Color060" style="background: #d09a45;"></option>
										<option value="Color070" style="background: #e4b138;"></option>
										<option value="Color080" style="background: #ee903c;"></option>
										<option value="Color081" style="background: #f08500;"></option>
										<option value="Color082" style="background: #a9d92d;"></option>
										<option value="Color090" style="background: #dd6549;"></option>
										<option value="Color100" style="background: #cc463d;"></option>
										<option value="Color101" style="background: #cf3e36;"></option>
										<option value="Color102" style="background: #5E6671;"></option>
									</select>
								</div>

								<div class="form-group ">
									<label for="brand_name">商户名字：</label>
									<input max-in='12' type="text" class=" form-control " id="brand_name" name="brand_name" placeholder="">
									<span>
										<a>0</a>
										/12
									</span>
									<p class="help-block">字数上限为12个汉字。</p>
								</div>

								<div class="form-group ">
									<label for="brand_name">团购券显示方式：</label>
									<select class="form-control"  name="code_type">
										<option value="CODE_TYPE_TEXT">文本</option>
										<option value="CODE_TYPE_BARCODE">一维码</option>
										<option value="CODE_TYPE_QRCODE">二维码</option>
										<option value="CODE_TYPE_ONLY_QRCODE">二维码无code显示</option>
										<option value="CODE_TYPE_ONLY_BARCODE">一维码无code显示</option>
									</select>
								</div>

								<div class="form-group ">
									<label for="title">卡券名：</label>
									<input max-in='9' type="text" class=" form-control " id="title" name="title" placeholder="">
									<span>
										<a>0</a>
										/9
									</span>
									<p class="help-block">字数上限为9个汉字。(建议涵盖卡券属性、服务及金额)。</p>
								</div>

								<div class="form-group ">
									<label for="sub_title">券名：</label>
									<input max-in='18' type="text" class=" form-control " id="sub_title" name="sub_title" placeholder="">
									<span>
										<a>0</a>
										/18
									</span>
									<p class="help-block">券名，字数上限为18个汉字。</p>
								</div>

								<div class="form-group ">
									<label for="notice">卡券使用提醒：</label>
									<input max-in='16' type="text" class=" form-control " id="notice" name="notice" placeholder="">
									<span>
										<a>0</a>
										/16
									</span>
									<p class="help-block">字数上限为16个汉字。</p>
								</div>

								<div class="form-group ">
									<label for="quantity">卡券库存的数量：</label>
									<input  type="text" class=" form-control " id="quantity" name="quantity" placeholder="">
									<p class="help-block">上限为100000000。</p>
								</div>

								<div class="form-group ">
									<label for="description">申请理由：</label>
									<textarea  max-in='1024' class="form-control" id="description" name="description" rows="3"></textarea>
									<span>
										<a>0</a>
										/1024
									</span>
									<p class="help-block">字数上限为1024个汉字。</p>
								</div>

								<div class="form-group ">
									<label for="begin_timestamp">开始时间：</label>
									<div class="input-group date form_datetime col-md-5" data-date="1979-09-16T05:25:07Z" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dtp_input1">
										<input class="form-control" size="16" type="text" value="" readonly id="begin_timestamp" name="begin_timestamp" >
										<span class="input-group-addon">
											<span class="glyphicon glyphicon-th"></span>
										</span>
									</div>
									<p class="help-block">起用时间。</p>
								</div>

								<div class="form-group ">
									<label for="end_timestamp">结束时间：</label>
									<div class="input-group date form_datetime col-md-5" data-date="1979-09-16T05:25:07Z" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dtp_input1">
										<input class="form-control" size="16" type="text" value="" readonly id="end_timestamp" name="end_timestamp" >
										<span class="input-group-addon">
											<span class="glyphicon glyphicon-th"></span>
										</span>
									</div>
									<p class="help-block">结束时间。</p>
								</div>
								<div class="form-group ">
									<label for="default_detail">优惠详情：</label>
									<input  type="text" class=" form-control " id="default_detail" name="default_detail" placeholder="">
									<p class="help-block">优惠券专用，填写优惠详情。</p>
								</div>

								<p class='hr'>非必填：</p>

								<div class="form-group ">
									<label for="service_phone">客服电话：</label>
									<input  type="text" class=" form-control " id="service_phone" name="service_phone" placeholder=""></div>

								<div class="form-group ">
									<label for="get_limit">每人可领券的数量：</label>
									<input  type="text" class=" form-control " id="get_limit" name="get_limit" placeholder="">
									<p class="help-block">不填写默认为50。</p>
								</div>

								<div class="form-group ">
									<label for="can_share">卡券领取页面是否可分享：</label>
									<select class="form-control"  name="can_share" id="can_share">
										<option value="true">是</option>
										<option value="false">否</option>
									</select>
								</div>

								<div class="form-group ">
									<label for="can_give_friend">卡券是否可转赠：</label>
									<select class="form-control"  name="can_give_friend" id="can_give_friend">
										<option value="true">是</option>
										<option value="false">否</option>
									</select>
								</div>

								<div class="form-group ">
									<label for="deal_detail">团购详情：</label>
									<textarea  max-in='24' class="form-control" id="deal_detail" name="deal_detail" rows="3"></textarea>
									<span>
										<a>0</a>
										/24
									</span>
									<p class="help-block">字数上限为24个汉字。</p>
								</div>
								<input type="submit" class="btn btn-warning" value="创建卡券"></form>
						</div>
					</div>

					<script>
function tt() {
  var aa = document.getElementById('cardtype');

  if(aa.value == 'tuan'){
	  $('#biao').children().css('display','none');

	  $('.tuan').css('display','block');
  }else if(aa.value == 'dai'){
	  $('#biao').children().css('display','none');
  	$('.dai').css('display','block');
  }else if(aa.value == 'zhe'){
	  $('#biao').children().css('display','none');
  	$('.zhe').css('display','block');
  }else if(aa.value == 'li'){
	  $('#biao').children().css('display','none');
  	$('.li').css('display','block');
  }else if(aa.value == 'you'){
	  $('#biao').children().css('display','none');
  	$('.you').css('display','block');
  }

  
}

	function selectColor(d){
		console.dir($(d))
		$(d).css('background',$(d).find(':selected').css('background'))
	}
</script>
				</div>
			</div>
		</div>

</body>
	</html>