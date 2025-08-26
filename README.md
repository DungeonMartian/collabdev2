# collabdev2
Live HyperGameDev collab Number 2! With DungeonMartian and Rogi's Tutorials


<li>Keys</li>
<ul><li>Be collectable</li>
	<li>Need a final visual representation</li>
	<li>Needs Testing: Add up to the req amount to open the door</li>
	<li>Be added in scene and tested</li>
</ul>
<li>Door</li>
<ul><li>Needs a visual representation</li>
	<li>Needs Testing: Ensure door cannot open if req keys unmet</li>
	<li>The door somehow indicates keys are needed?</li>
	<li>Needs Testing: Ensure door does open if req keys met</li>
	<li>Walking through an open door, ends the game satisfyingly</li>
</ul>

<li>Torches</li>
<ul>
	<li>Needs a visual representation</li>
 	<li>Collectable (1 at time?)</li>
	<ul>
		Can the player hold it once collected?
</ul>
  	<li>Fuel tracking needs to be present</li>
   <li>Needs to get removed when fuel is empty</li>
	<li>Needs Testing: Does having one actually stop/reduce danger%</li>
</ul>

<li>Monster</li>
<ul>
	<li>Needs to be tested inscene </li>
	<li>Does it dis/appear gradually based on danger level?</li>
	<li>Do the animations work right and stuff?</li>
	<li>Does the player "lose" when it's too close (danger too high)?</li>
	<li>How is game over communicated and handled (reset etc)</li>
</ul>

<li>Music</li>
<ul><li>Is it properly managed?</li>
	<li>Is audio controllable by menu?</li>
	<li>Does the music change based on Danger level?</li>
</ul>

<li>SFX</li>
<ul>
	<li>Are they managed</li>
	<li>Do the important ones fire when they should?</li>
</ul>

<li>VFX</li>
<ul>
	<li>Do tunnel eyes increase/become visible as danger increases?</li>
	<li>Are desired visual shader effects also dialed into danger?</li>
</ul>

<li>Level Design - Lyz at minimum
<li>Torch Design + Mechanics></li>
<li>Monster stat + mechanics/side effects - Dungeon</li>
<li>1st Person player controller - Lyz</li>
<li>Key system (checks for all keys, door is opennable when all collected)</li>
<ul>
	<li>Configurable required key count</li></ul>
<li>Water design / slows down/mechanics - Dungeon</li>
<li>Intro cutscene/death loop</li>
<li>Audio - Dungeon</li>
<li>Art Assets</li>

<li>Minimum game - Collect key(s), open door, torch system, Monster stat</li>



<li>Door shuts in face at start</li>
<ul>
	<li>(Low Priority: hear locking sounds)</li></ul>

<li>Underwater Sewer, First Person</li>
<li>Have to find 3 keys in specific locations</li>

<li>Torches too</li>

<li>Monstermeter constantly increases</li>
	<ul><li>Unless you have torch</li></ul>
<li>Monstermeter has 25% segments,</li>
	<ul><li>Only collecting keys clears meter</li></ul>
	<ul><li>Getting a torch clears current segment,</li>
		<ul><li>and prevents meter increase</li>
		<li>Torch has time limit</li>
			<ul><li>water also puts it out</li></ul></ul>

<li>More eyeballs appear as meter increases</li>
	<ul><li>(Stretch Goal: Screentears, Sound events)</li></ul>

<li>Monstermeter > 75% =</li>
	<ul><li>apparation appears, gets closer/bigger/more visible</li></ul>
<li>Monsmeter >= 100% =</li>
	<ul><li>"Jumpscare"/Start over</li></ul>
