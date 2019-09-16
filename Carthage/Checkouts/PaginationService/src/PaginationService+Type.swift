import Foundation

extension PaginationService {
//   public typealias GetItemsComplete = (_ success: Bool, _ items: [T]) -> Void
   public typealias GetItemsCompleted = (Result<[T], PaginationServiceError>) -> Void
}
