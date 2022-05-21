//
//  adrianMovieDBTests.swift
//  adrianMovieDBTests
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import XCTest
@testable import adrianMovieDB

class adrianMovieDBTests: XCTestCase {
    class MockMovieProvider: ProviderContract {
        let movies: Movie = .init(id: 1, title: "Test Title", favorite: true, year: "Test Year", image: "Test Image")
        var shouldFail = false
        
        func fetchMovies(page: Int, section: UrlParameter, query: String, _ completion: @escaping (Result<[Movie], ProviderError>) -> Void) {
            if shouldFail {
                completion(.failure(.generic((Error.self as! Error))))
            } else {
                completion(.success([movies]))
            }
        }
    }
    
    class MockedMovieInteractorOutput: PopularOutputContract {
        
        var movie: Movie?
        var didFailGetMovies = false

        func didFetch(movies: [Movie]) {
            self.movie = movies[0]
            expectation.fulfill()
        }
        
        func didFetchFail(movies: [Movie]) {
        }
        
        func didUpdateFavorites(in movie: Movie, favorite: Bool) {
        }
        
        let expectation: XCTestExpectation
        init(expectation: XCTestExpectation) {
            self.expectation = expectation
        }
    }

    func test_ShouldFetchMovieData() {
        let expectation = expectation(description: "")
        
        let output = MockedMovieInteractorOutput(expectation: expectation)
        let provider = MockMovieProvider()
        let sut = PopularInteractor()
        
        sut.popularProvider = provider
        sut.output = output
        sut.fetchMovies(page: 1, section: .popular, query: "")
        
        waitForExpectations(timeout: 0.5) { _ in
            XCTAssert(expectation.assertForOverFulfill)
        }
    }
}
