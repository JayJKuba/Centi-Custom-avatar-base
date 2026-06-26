-- Auto generated script file --
local squapi = require("SquAPI")


--hide vanilla model
vanilla_model.PLAYER:setVisible(false)



local tails = {
	models.model.root.Body.Tail,
	models.model.root.Body.Tail.Tail2,
	models.model.root.Body.Tail.Tail2,
	models.model.root.Body.Tail.Tail2.Tail3,
	models.model.root.Body.Tail.Tail2.Tail3.Tail4,
	models.model.root.Body.Tail.Tail2.Tail3.Tail4.Tail5,
	models.model.root.Body.Tail.Tail2.Tail3.Tail4.Tail5.Tail6,
	models.model.root.Body.Tail.Tail2.Tail3.Tail4.Tail5.Tail6.Tail7,
	models.model.root.Body.Tail.Tail2.Tail3.Tail4.Tail5.Tail6.Tail7.Tail8,
	models.model.root.Body.Tail.Tail2.Tail3.Tail4.Tail5.Tail6.Tail7.Tail8.Tail9,

	}
	--replace each nil with the value/parmater you want to use, or leave as nil to use default values :)
	squapi.tails(tails,
		0.6, --intensity
		nil, --tailintensityY
		nil, --tailintensityX
		.7, --tailYSpeed
		.7, --tailXSpeed
		0.4, --tailVelBend
		nil, --initialTailOffset
		nil, --segOffsetMultiplier
		nil, --tailStiff
		nil, --tailBounce
		nil, --downlimit
		nil  --uplimit
	)