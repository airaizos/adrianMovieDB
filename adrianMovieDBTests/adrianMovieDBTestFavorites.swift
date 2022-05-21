//
//  adrianMovieDBTestFavorites.swift
//  adrianMovieDBTests
//
//  Created by Adrian Iraizos Mendoza on 21/5/22.
//

import XCTest
@testable import adrianMovieDB

class adrianMovieDBTestFavorites: XCTestCase {
    
    class MockFavoriteProvider: FavoritesProviderContract {
        let favoriteMovie: Movie = .init(id: 0, title: "TestFavoriteTitle", favorite: true, year: "TestFavoriteYear", image: "TestFavoriteImage")
        
        var shouldFail = false
        func getFavorite(_ completion: @escaping (Result<[Movie], ProviderError>) -> Void) {
            if shouldFail {
                completion(.failure(.badUrl))
            } else {
                completion(.success([favoriteMovie]))
            }
        }
    }
    
    class MockedFavoriteInteractorOutput: FavoritesOutputContract {
        
        let expectation: XCTestExpectation
        init(expectation: XCTestExpectation) {
            self.expectation = expectation
        }
        var favoriteMovie: Movie?
        var didFailGetMovies = false
        
        func getFavorites(movies: [Movie]) {
            self.favoriteMovie = movies[0]
            expectation.fulfill()
        }
        
        func getFavoritesFail(movies: [Movie]) {
            didFailGetMovies = true
            expectation.fulfill()
        }
    }
    
    func test_ShouldFetchFavoriteMovie() {
        let expectation = expectation(description: "")
        let output = MockedFavoriteInteractorOutput(expectation: expectation)
        let provider = MockFavoriteProvider()
        let sut = FavoritesInteractor()
        
        sut.favoritesProvider = provider
        sut.output = output
        sut.getFavorite()
        
        waitForExpectations(timeout: 0.5) { _ in
            XCTAssert(expectation.assertForOverFulfill)
        }
    }
}
