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
					<h2>修改卡卷</h2>
					<form action="cardUpdate" method="post" enctype="multipart/form-data">
							<input type="hidden" name="card_type" value="<?php echo $card_info->card_type; ?>" >
							<input type="hidden" name="card_id" value="<?php echo $card_info->card_id; ?>" >
							<input type="hidden" name="id" value="<?php echo $card_info->id; ?>" >

							<div class="form-group ">
								<label for="logo">上传卡券LOGO：</label>
								<input type="file" name="logo" id="logo" >
								<p class="help-block">上传的图片限制文件大小限制1MB，像素为300*300，仅支持JPG、PNG格式。</p>
								<img src="<?php echo $card_info->logo_url; ?>"></div>
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
								<input max-in='12' type="text" class=" form-control " id="brand_name" name="brand_name" placeholder="" value="<?php echo $card_info->brand_name; ?>" readonly>
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
								<input max-in='9' type="text" class=" form-control " id="title" name="title" placeholder="" readonly value="<?php echo $card_info->title; ?>">
								<span>
									<a>0</a>
									/9
								</span>
								<p class="help-block">字数上限为9个汉字。(建议涵盖卡券属性、服务及金额)。</p>
							</div>

							<div class="form-group ">
								<label for="sub_title">券名：</label>
								<input max-in='18' type="text" class=" form-control " id="sub_title" name="sub_title" placeholder="" readonly value="<?php echo $card_info->sub_title; ?>">
								<span>
									<a>0</a>
									/18
								</span>
								<p class="help-block">券名，字数上限为18个汉字。</p>
							</div>

							<div class="form-group ">
								<label for="notice">卡券使用提醒：</label>
								<input max-in='16' type="text" class=" form-control " id="notice" name="notice" placeholder="" value="<?php echo $card_info->notice; ?>">
								<span>
									<a>0</a>
									/16
								</span>
								<p class="help-block">字数上限为16个汉字。</p>
							</div>

							<div class="form-group ">
								<label for="quantity">卡券库存的数量：</label>
								<input  type="text" class=" form-control " id="quantity" name="quantity" placeholder="" readonly value="<?php $r = json_decode($card_info->sku,true);echo $r['quantity']; ?>">
							<p class="help-block">上限为100000000。</p>
							</div>

							<div class="form-group ">
								<label for="description">申请理由：</label>
								<textarea max-in='1024' class="form-control" id="description" name="description" rows="3"><?php echo $card_info->description; ?></textarea>
								<span>
									<a>0</a>
									/1024
								</span>
								<p class="help-block">字数上限为1024个汉字。</p>
							</div>

							<div class="form-group ">
								<label for="begin_timestamp">开始时间：</label>

								<div class="input-group date form_datetime col-md-5" data-date="1979-09-16T05:25:07Z" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dtp_input1">
									<input class="form-control" size="16" type="text" value="<?php $r = json_decode($card_info->date_info,true);echo date("Y-m-d H:i:s",$r['begin_timestamp']); ?>
								" readonly id="begin_timestamp" name="begin_timestamp" >
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-th"></span>
								</span>
							</div>
							<p class="help-block">起用时间。</p>
						</div>

						<div class="form-group ">
							<label for="end_timestamp">结束时间：</label>
							<div class="input-group date form_datetime col-md-5" data-date="1979-09-16T05:25:07Z" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dtp_input1">
								<input class="form-control" size="16" type="text" value="<?php $r = json_decode($card_info->date_info,true);echo date("Y-m-d H:i:s",$r['end_timestamp']); ?>
							" readonly id="end_timestamp" name="end_timestamp" >
							<span class="input-group-addon">
								<span class="glyphicon glyphicon-th"></span>
							</span>
						</div>
						<p class="help-block">结束时间。</p>
					</div>
					<?php if($card_info->card_type== 'GROUPON'){ ?>
					<div class="form-group ">
						<label for="deal_detail">团购详情：</label>
						<textarea readonly  max-in='24' class="form-control" id="deal_detail" name="deal_detail" rows="3"><?php echo $card_info->deal_detail; ?></textarea>
						<span>
							<a>0</a>
							/24
						</span>
						<p class="help-block">字数上限为24个汉字。</p>
					</div>
					<?php }elseif($card_info->card_type== 'CASH'){ ?>
					<div class="form-group ">
						<label for="least_cost">起用金额：</label>
						<input readonly type="text" class="form-control " id="least_cost" name="least_cost" placeholder="" value="<?php echo $card_info->least_cost; ?>">
						<p class="help-block">代金券专用，表示起用金额（单位为分）,如果无起用门槛则填0。</p>
					</div>

					<div class="form-group ">
						<label for="reduce_cost">减免金额：</label>
						<input readonly type="text" class=" form-control " id="reduce_cost" name="reduce_cost" placeholder="" value="<?php echo $card_info->reduce_cost; ?>">
						<p class="help-block">代金券专用，表示减免金额。（单位为分）</p>
					</div>

					<?php }elseif($card_info->card_type== 'DISCOUNT'){ ?>
					<div class="form-group ">
						<label for="discount">打折额度：</label>
						<input readonly type="text" class=" form-control " id="discount" name="discount" placeholder="" value="<?php echo $card_info->discount; ?>">
						<p class="help-block">折扣券专用，表示打折额度（百分比）。填30就是七折。</p>
					</div>
					<?php }elseif($card_info->card_type== 'GIFT'){ ?>
					<div class="form-group ">
						<label for="gift">填写礼品的名称：</label>
						<input  type="text" class=" form-control " id="gift" name="gift" placeholder="" readonly value="<?php echo $card_info->gift; ?>">
						<p class="help-block">礼品券专用，填写礼品的名称。</p>
					</div>
					<?php }elseif($card_info->card_type== 'GENERAL_COUPON'){ ?>
					<div class="form-group ">
						<label for="default_detail">优惠详情：</label>
						<input  type="text" class=" form-control " id="default_detail" name="default_detail" placeholder="" readonly value="<?php echo $card_info->default_detail; ?>">
						<p class="help-block">优惠券专用，填写优惠详情。</p>
					</div>
					<?php } ?>
					<p class='hr'>非必填：</p>

					<div class="form-group ">
						<label for="service_phone">客服电话：</label>
						<input  type="text" class=" form-control " id="service_phone" name="service_phone" placeholder="" value="<?php echo $card_info->service_phone; ?>"></div>

					<div class="form-group ">
						<label for="get_limit">每人可领券的数量：</label>
						<input  type="text" class=" form-control " id="get_limit" name="get_limit" placeholder="" value="<?php echo $card_info->get_limit; ?>">
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

					<input type="submit" class="btn btn-warning" value="确认修改"></form>
				</div>
			</div>
		</div>

</body>
	</html>