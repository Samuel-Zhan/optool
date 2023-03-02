//
//  XPMSignatureHashTests.m
//  ArgumentParser
//
//  Created by Christopher R. Miller on 2/5/15.
//
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

#import "XPMArgumentSignature.h"
#import "XPMCountedArgument.h"
#import "XPMValuedArgument.h"

@interface XPMSignatureHashTests : XCTestCase

@end

@implementation XPMSignatureHashTests

- (void)setUp {
	[super setUp];
	// Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
	// Put teardown code here. This method is called after the invocation of each test method in the class.
	[super tearDown];
}

- (void)testCountedArgument
{
  XPMCountedArgument * c0 = [XPMCountedArgument countedArgumentWithSwitches:[NSSet setWithObjects:@"v", @"verbose", nil] aliases:nil];
  XPMCountedArgument * c0_copy = [c0 copy];
  XPMCountedArgument * c1 = [XPMCountedArgument countedArgumentWithSwitches:[NSSet setWithObjects:@"v", @"verbose", nil] aliases:nil];
  XPMCountedArgument * c2 = [XPMCountedArgument countedArgumentWithSwitches:[NSSet setWithObjects:@"f", @"file", nil] aliases:nil];
  XPMCountedArgument * c3 = [XPMCountedArgument countedArgumentWithSwitches:[NSSet setWithObjects:@"v", [NSString stringWithFormat:@"%@%@", @"ver", @"bose"], nil] aliases:nil]; // should make it a different string in memory, too. I just want to check this to be sure. If it's right here, then it'll be correct in the other three tests, too.
  
  XCTAssertEqual([c0 hash], [c0_copy hash], @"For some reason c0 has a different hash from c0_copy.");
  XCTAssertTrue([c0 isEqual:c0_copy], @"c0 isn't equal to its copy.");
  
  XCTAssertEqual([c0 hash], [c1 hash], @"For some reason c0 has a different hash from its twin, c1.");
  XCTAssertTrue([c0 isEqual:c1], @"c0 isn't equal to its twin, c1.");
  
  XCTAssertFalse([c0 hash] == [c2 hash], @"c0 has the same hash has c2, which it shouldn't.");
  XCTAssertFalse([c0 isEqual:c2], @"c0 is somehow equal to c2; it shouldn't be.");
  
  XCTAssertEqual([c0 hash], [c3 hash], @"For some reason c0 has a different hash from c3.");
  XCTAssertTrue([c0 isEqual:c3], @"c0 isn't equal to its twin, c3.");
}

- (void)testValuedArgument
{
  XPMValuedArgument * v0 = [XPMValuedArgument valuedArgumentWithSwitches:[NSSet setWithObjects:@"f", @"file", nil] aliases:nil];
  XPMValuedArgument * v0_copy = [v0 copy];
  XPMValuedArgument * v1 = [XPMValuedArgument valuedArgumentWithSwitches:[NSSet setWithObjects:@"f", @"file", nil] aliases:nil];
  XPMValuedArgument * v2 = [XPMValuedArgument valuedArgumentWithSwitches:[NSSet setWithObjects:@"p", @"phallus", nil] aliases:nil];
  
  XCTAssertEqual([v0 hash], [v0_copy hash], @"For some reason v0 has a different hash from v0_copy.");
  XCTAssertTrue([v0 isEqual:v0_copy], @"v0 isn't equal to its copy.");
  
  XCTAssertEqual([v0 hash], [v1 hash], @"For some reason v0 has a different hash from its twin, v1.");
  XCTAssertTrue([v0 isEqual:v1], @"v0 isn't equal to its twin, v1.");
  
  XCTAssertFalse([v0 hash] == [v2 hash], @"v0 has the same hash as v2, which it shouldn't.");
  XCTAssertFalse([v0 isEqual:v2], @"v0 is somehow equal to v2; it shouldn't be.");
}

@end
