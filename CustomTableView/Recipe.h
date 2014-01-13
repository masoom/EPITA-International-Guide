//
//  Recipe.h
//  RecipeBook
//


#import <Foundation/Foundation.h>

@interface Recipe : NSObject

@property (nonatomic, strong) NSString *headline; // name of recipe
@property (nonatomic, strong) NSString *description; // recipe detail
@property (nonatomic, strong) NSString *imageFile; // image filename of recipe

@end
