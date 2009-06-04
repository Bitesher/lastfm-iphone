/* NSString+URLEscaped.h - Make an NSString object URL-safe
 * 
 * Copyright 2009 Last.fm Ltd.
 *   - Primarily authored by Sam Steele <sam@last.fm>
 *
 * This file is part of MobileLastFM.
 *
 * MobileLastFM is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2
 * as published by the Free Software Foundation.
 *
 * MobileLastFM is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
 */

#import "NSString+URLEscaped.h"

@implementation NSString (URLEscaped)
- (NSString *)URLEscaped {
	CFStringRef escaped = CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)self, NULL, (CFStringRef)@"&+/?", kCFStringEncodingUTF8);
	NSString *out = [NSString stringWithString:(NSString *)escaped];
	CFRelease(escaped);
	return [[out copy] autorelease];
}
- (NSString *)unURLEscape {
	CFStringRef unescaped = CFURLCreateStringByReplacingPercentEscapes(NULL, (CFStringRef)self, (CFStringRef)@"");
	NSString *out = [NSString stringWithString:(NSString *)unescaped];
	CFRelease(unescaped);
	return [[out copy] autorelease];
}
@end
