import Foundation

extension PaginationService {
   /**
    * Errors for the PaginationService
    * - Note: Since there is only:
    */
   public enum PaginationServiceError: Error {
      case noItemAtThatIndex
   }
}
