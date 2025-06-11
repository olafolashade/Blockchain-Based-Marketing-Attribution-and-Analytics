;; Marketing Agency Verification Contract
;; Validates and manages marketing service providers

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_AGENCY_EXISTS (err u101))
(define-constant ERR_AGENCY_NOT_FOUND (err u102))
(define-constant ERR_INVALID_STATUS (err u103))

;; Agency verification status
(define-constant STATUS_PENDING u0)
(define-constant STATUS_VERIFIED u1)
(define-constant STATUS_REJECTED u2)
(define-constant STATUS_SUSPENDED u3)

;; Data structures
(define-map agencies
  { agency-id: uint }
  {
    owner: principal,
    name: (string-ascii 100),
    status: uint,
    verification-date: uint,
    reputation-score: uint
  }
)

(define-map agency-counter principal uint)
(define-data-var next-agency-id uint u1)

;; Register a new marketing agency
(define-public (register-agency (name (string-ascii 100)))
  (let ((agency-id (var-get next-agency-id)))
    (asserts! (is-none (map-get? agencies { agency-id: agency-id })) ERR_AGENCY_EXISTS)
    (map-set agencies
      { agency-id: agency-id }
      {
        owner: tx-sender,
        name: name,
        status: STATUS_PENDING,
        verification-date: block-height,
        reputation-score: u50
      }
    )
    (map-set agency-counter tx-sender agency-id)
    (var-set next-agency-id (+ agency-id u1))
    (ok agency-id)
  )
)

;; Verify an agency (only contract owner)
(define-public (verify-agency (agency-id uint))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (match (map-get? agencies { agency-id: agency-id })
      agency-data
      (begin
        (map-set agencies
          { agency-id: agency-id }
          (merge agency-data { status: STATUS_VERIFIED, verification-date: block-height })
        )
        (ok true)
      )
      ERR_AGENCY_NOT_FOUND
    )
  )
)

;; Update agency reputation score
(define-public (update-reputation (agency-id uint) (new-score uint))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (asserts! (<= new-score u100) ERR_INVALID_STATUS)
    (match (map-get? agencies { agency-id: agency-id })
      agency-data
      (begin
        (map-set agencies
          { agency-id: agency-id }
          (merge agency-data { reputation-score: new-score })
        )
        (ok true)
      )
      ERR_AGENCY_NOT_FOUND
    )
  )
)

;; Get agency information
(define-read-only (get-agency (agency-id uint))
  (map-get? agencies { agency-id: agency-id })
)

;; Check if agency is verified
(define-read-only (is-agency-verified (agency-id uint))
  (match (map-get? agencies { agency-id: agency-id })
    agency-data (is-eq (get status agency-data) STATUS_VERIFIED)
    false
  )
)
