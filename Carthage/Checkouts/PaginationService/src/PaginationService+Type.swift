import Foundation

extension PaginationService {
   public typealias GetItemsCompleted = (Result<[T], PaginationServiceError>) -> Void
}
