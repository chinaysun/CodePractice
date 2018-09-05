//
//  StickyHeaderViewModel.swift
//  CodePracticeExample
//
//  Created by Yu Sun on 4/9/18.
//  Copyright © 2018 Yu Sun. All rights reserved.
//

import RxSwift

class StickyHeaderViewModel {
    
    
    // MARK: - Observables
    lazy var header: Observable<String> = Observable.just("The\nBeatles")
    
    lazy var headerCopy: Observable<String> = Observable.just("The Beatles were an English rock band formed in Liverpool in 1960. With members John Lennon, Paul McCartney, George Harrison and Ringo Starr. They become widely regarded as the foremost and most influential music band in history!!!")
    
    lazy var johnCopy: Observable<String> = Observable.just("John Winston Ono Lennon (9 October 1940 - 8 December 1980) was an English singer, songwriter, and peace activist who co-founded the Beatles, the most commercially successful band in the history of popilar music")
    
    lazy var paulCopy: Observable<String> = Observable.just("Sir James Paul McCartney (born 18 June 1942) is an English singer-songwriter, multi-instrumentalist, and composer. He gained worldwide fame as the bass guitarist and singer for the rock band the Beatles, widely considered the most popular and influential group in the history of pop music")
    
    lazy var georgeCopy: Observable<String> = Observable.just("George Harrison (25 February 1943 – 29 November 2001) was an English guitarist, singer-songwriter, and producer who achieved international fame as the lead guitarist of the Beatles. Often referred to as 'the quiet Beatle', Harrison embraced Indian culture and helped broaden the scope of popular music through his incorporation of Indian instrumentation and Hindu-aligned spirituality in the Beatles' work.")
    
    lazy var ringoCopy: Observable<String> = Observable.just("Sir Richard Starkey (born 7 July 1940), known professionally as Ringo Starr, is an English musician, singer-songwriter and actor who gained worldwide fame as the drummer for the Beatles. He occasionally sang lead vocals, usually for one song on an album, including 'With a Little Help from My Friends', 'Yellow Submarine', 'Good Night', and their cover of 'Act Naturally'.")
    
}
