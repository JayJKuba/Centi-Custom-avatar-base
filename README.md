# Centi-Custom-avatar-base

A repo for a modified "Centi the centipede" figura avatar created by proto_narrator, these were modified to allow for a simple skin texture swap for a custom skin, there are also bonus versions with a modified postman67's local chat helper, a name gradient and an armor visibility toggle

## Contents

In this repo you will find 4 different folders with 4 slightly different avatar bases, these are as follow:

- Centi Custom
- Centi Custom (+ localchat and gradient)
- Centi Custom Slim
- Centi Custom Slim (+ localchat and gradient)

The Slim tag means that the avatar uses the slim type of minecraft skins instead of the default one.

The (+ localchat and gradient) tag means that the avatar includes the modified local chat script, the gradient script and an action wheel which lets you toggle armor visibility and also turn on a "fun" mode for the localchat.

localchat is toggleable by pressing `\` by default

## Customization

To modify the gradient colors go into `colorLerpName.lua` and change `local colors` to a list of colors you want to use.

To modify the localchat open `PostmansLocalSpeechHelper.lua` and modify it however you need (some parts might be a bit complicated but you'll figure it out :D)

If you would like to get rid of/add back the pinchers, the antenna etc. just hide/show the appropriate parts in the `model.bbmodel`
