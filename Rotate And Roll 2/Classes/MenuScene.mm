//
//  GameScene.mm
//
//  Copyright GameXtar 2010. All rights reserved.
//
//	info@gamextar.com
//	http://www.gamextar.com - iPhone Development 
//
//

#import "MenuScene.h"
#import "ChapterSelect.h"  
#import "ConfigScene.h"
#import "SimpleAudioEngine.h"
#import "EndScene.h"
#import "GameData.h"
#import "GameCenterManager.h"

extern GameData *gameData;

@implementation MenuScene

+(id)scene
{
	CCScene *scene =[CCScene node];
	MenuScene *layer = [MenuScene node];
	[scene addChild: layer];
	
	return scene;
	
}


-(id) init
{
	if( (self=[super init]) )
	{
		
        // self.touchEnabled = YES;

        size = [[CCDirector sharedDirector] winSize];
        
        
        CCSprite *bg = [CCSprite spriteWithFile:@"fondomundo1.png"];
		bg.position = ccp(size.width/2,size.height/2);
        [self addChild: bg z:0];

        
        CCParticleSystemQuad *particleSystem = [CCParticleSystemQuad particleWithFile:@"introparticles.plist"];
        particleSystem.position = ccp(size.width/2, size.height*0.2);
        [self addChild:particleSystem z:1];
        
		CCSprite *intro = [CCSprite spriteWithFile: @"intro.png"];
		intro.position = ccp(size.width/2,size.height/2);
		[self addChild: intro z:2];
		
		
		for(int i = 0; i<30;i++)
		{
			CCSprite *estrellita = [CCSprite spriteWithFile:@"skystar1.png"];

			estrellita.position = ccp(random() % (int)size.width, (random() % (int)size.height)+100);
			estrellita.rotation = CCRANDOM_0_1() * 360;
			estrellita.scale = CCRANDOM_0_1() * 1;
			
			id ojos = [CCScaleBy actionWithDuration:0.5 scale:2.0f];
			id ojos_back = [ojos reverse];
			id hacerojos = [CCRepeatForever actionWithAction: [CCSequence actions: ojos, ojos_back, nil]];
			[estrellita runAction: hacerojos];
			
			[self addChild:estrellita z:0];
			
		}
		
		for(int i = 0; i<40;i++)
		{
			CCSprite *estrellita = [CCSprite spriteWithFile:@"skystar2.png"];
			estrellita.position = ccp(random() % (int)size.width, (random() % (int)size.height)+100);
			estrellita.rotation = CCRANDOM_0_1() * 360;
			estrellita.scale = CCRANDOM_0_1() * 2 + 0.2;
			
			[self addChild:estrellita z:0];
			
		}
		
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"background.caf"];	
		
		CCSprite *destello = [CCSprite spriteWithFile: @"destello.png"];
		destello.position = ccp(size.width/2,size.height/2);
		[self addChild: destello z:0];
		
		/*
		CCSprite *titulo = [CCSprite spriteWithFile: @"titulo.png"];
		titulo.position = ccp(size.width/2+5,size.height/2+5);
		[self addChild: titulo z:0];
		
		
		CCSprite *ruedita1 = [CCSprite spriteWithFile: @"ruedita.png"];
		ruedita1.position = ccp(70,98);
		[titulo addChild: ruedita1 z:0];
		
		
		CCSprite *ruedita2 = [CCSprite spriteWithFile: @"ruedita.png"];
		ruedita2.position = ccp(115,28);
		[titulo addChild: ruedita2 z:0];
		
         
		CCSprite *bolas = [CCSprite spriteWithFile: @"bolas.png"];
		bolas.position = ccp(72,48);
		[self addChild: bolas z:0];

		
		CCSprite *ojitos = [CCSprite spriteWithFile: @"ojitos.png"];
		ojitos.position = ccp(22,25);
		ojitos.scale = 1.3;
		ojitos.rotation = 355;
		[bolas addChild: ojitos z:0];
		
		 
		
		CCSprite *ojitos2 = [CCSprite spriteWithFile: @"ojitos.png"];
		ojitos2.position = ccp(86,32);
		ojitos2.scale = 1.2;
		ojitos2.rotation = 355;
		[bolas addChild: ojitos2 z:0];
		
		
		id ojos = [CCScaleBy actionWithDuration:0.08 scaleX:1 scaleY:0.05f];
		id ojos_back = [ojos reverse];
		id delay = [CCDelayTime actionWithDuration:3];
		
		id hacerojos = [CCRepeatForever actionWithAction: [CCSequence actions: ojos, ojos_back, delay, nil]];
		[ojitos runAction: hacerojos];

		
		id ojos2 = [CCScaleBy actionWithDuration:0.08 scaleX:1 scaleY:0.05f];
		id ojos_back2 = [ojos2 reverse];
		id delay2 = [CCDelayTime actionWithDuration:5];
		
		id hacerojos2 = [CCRepeatForever actionWithAction: [CCSequence actions: ojos2, ojos_back2, delay2, nil]];
		[ojitos2 runAction: hacerojos2];
		
		
		id RotAction = [CCRotateBy actionWithDuration:1 angle:360];
		id RepeatAction = [CCRepeatForever actionWithAction: RotAction];
		
		id RotAction3 = [CCRotateBy actionWithDuration:15 angle:360];
		id RepeatAction3 = [CCRepeatForever actionWithAction: RotAction3];
				
		[ruedita1 runAction: RepeatAction];
		[ruedita2 runAction: [[RepeatAction copy] autorelease]];
		
		[destello runAction: RepeatAction3];
		
		
		id move = [CCMoveBy actionWithDuration:1.5 position:ccp(0, 10)];
		id move_back = [move reverse];
		id seq1 = [CCSequence actions: move, move_back, nil];
		
		[bolas runAction: [CCRepeatForever actionWithAction:seq1]];
		*/
		
		CCMenu *menu = [CCMenu menuWithItems:nil];
		
		
		CCMenuItemImage *facebook = [CCMenuItemImage itemWithNormalImage:@"boton-facebook.png" selectedImage:@"boton-facebook-over.png" target:self selector:@selector(facebook)];		
		[facebook setPosition:ccp(size.width-64,size.height-24)];
		[menu addChild:facebook];
		
		CCMenuItemImage *twitter = [CCMenuItemImage itemWithNormalImage:@"boton-twitter.png" selectedImage:@"boton-twitter-over.png" target:self selector:@selector(twitter)];
		[twitter setPosition:ccp(size.width-24,size.height-24)];
		[menu addChild:twitter];
		
		CCLabelTTF *twitterLabel = [CCLabelTTF labelWithString:@"Follow US =)"  fontName:@"Arnold 2.1" fontSize:12 dimensions:CGSizeMake(140,15) hAlignment:kCCTextAlignmentCenter];
		[twitterLabel setPosition:ccp(size.width-42,size.height-50)];
		[self addChild:twitterLabel];
		
		CCMenuItemImage *startNew = [CCMenuItemImage itemWithNormalImage:@"boton-play.png" selectedImage:@"boton-over.png" target:self selector:@selector(newGame)];		
		[startNew setPosition:ccp(size.width-32,32)];
		[menu addChild:startNew];
        
        
		CCMenuItemImage *tilt = [CCMenuItemImage itemWithNormalImage:@"boton-config.png" selectedImage:@"boton-over.png" target:self selector:@selector(setConfig)];
        [tilt setPosition:ccp(32,32)];
		[menu addChild:tilt];



/*        
 
 CCMenuItemImage *leaderboard = [CCMenuItemImage itemWithNormalImage:@"leaderboard.png" selectedImage:@"leaderboard.png" target:self selector:@selector(showLeaderBoard)];
 [leaderboard setPosition:ccp(448,90)];
 [menu addChild:leaderboard];
 
        CCMenuItemImage *achievements = [CCMenuItemImage itemWithNormalImage:@"achievements.png" selectedImage:@"achievements.png" target:self selector:@selector(showAchievements)];
        [achievements setPosition:ccp(32,90)];
		[menu addChild:achievements];
        
       */
        
		[menu setPosition:ccp(0,0)];				
		[self addChild:menu z:10];
         
        [GameCenterManager loadState];
        [[GameCenterManager sharedGameCenterManager] authenticateLocalPlayer];
        
        [[CDAudioManager sharedManager] setMode:kAMM_FxPlusMusicIfNoOtherAudio];
   
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"background.caf"];
		
		
	}
	return self;
}

-(void)newGame
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.4 scene:[ChapterSelect node] ]];

}


-(void)setConfig
{
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.4 scene:[ConfigScene scene] ]];
}


-(void)showLeaderBoard
{
	
   //
    [[GameCenterManager sharedGameCenterManager]showLeaderboardForCategory:@"total"];    
    
}

-(void)facebook
{
	NSURL * url = [[NSURL alloc] initWithString:@"http://www.facebook.com/rotateandroll"];
	[[UIApplication sharedApplication] openURL:url];
}

-(void)twitter
{
	NSURL * url = [[NSURL alloc] initWithString:@"http://www.twitter.com/gamextar"];
	[[UIApplication sharedApplication] openURL:url];
}

-(void)dealloc
{

	//NSLog(@"MENU DEALLOC %i", [self retainCount]); 
	[self stopAllActions];
	[self removeAllChildrenWithCleanup:YES];
	[super dealloc];
}
@end