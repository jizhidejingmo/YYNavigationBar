//
//  POPAnimation.m
//  test
//
//  Created by yangyang on 16/4/30.
//  Copyright © 2016年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "YYNavigationPopAnimation.h"

@implementation YYNavigationPopAnimation

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey]; // 动画来自哪个vc
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey]; // 转场到哪个vc
    
    // 转场动画是两个控制器视图的动画，需要一个containerView作为“舞台”
    UIView *containerView = [transitionContext containerView];
    [containerView insertSubview:toVC.view belowSubview:fromVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext]; // 获取动画执行时间（实现的协议方法）
    
    // 执行动画，让fromVC的view移动到屏幕最右侧
    [UIView animateWithDuration:duration animations:^{
        
        fromVC.view.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
        
    } completion:^(BOOL finished) {

        // 当动画执行完时，这个方法必须要调用，否则系统会认为你的其余操作都在动画执行过程中
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.25f;
}

@end
