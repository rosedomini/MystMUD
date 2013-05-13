
Power.new(:gain_de_vie, -> power{
	$p.instance_eval{
		heal power
		wiz "Vous vous sentez mieux et vos blessure guérissent. ~ #{power} points."
	}
})