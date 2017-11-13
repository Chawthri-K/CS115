;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a04q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; ***************************************************
;; Chawthri Kanagarasa (20724188)
;; CS 115 Fall 2017
;; Assignment 04, Problem 1
;; ***************************************************
;;

(define-struct particle (type energy))
;; A Particle is a (make-particle Sym Num)
;; Requires:
;;   type is 'photon, 'electron, or 'positron
;;   energy is positive

;;(type p1 p2) produces the type of particle that will be emitted.
;;type: particle particle --->  (anyof 'electron 'positron 'photon)
;;requires: p1 cannot be equal to p2
;;Example:
(check-expect (type (make-particle 'electron 2.4) (make-particle 'positron 2.4)) 'photon)

(define (type p1 p2)
  (cond [(and (symbol=? (particle-type p1) 'electron)
              (symbol=? (particle-type p2) 'positron)) 'photon]
        [(and (symbol=? (particle-type p1) 'positron)
              (symbol=? (particle-type p2) 'electron)) 'photon]
        [(and (symbol=? (particle-type p1) 'electron)
              (symbol=? (particle-type p2) 'photon)) 'electron]
        [(and (symbol=? (particle-type p1) 'photon)
              (symbol=? (particle-type p2) 'electron)) 'electron]
        [(and (symbol=? (particle-type p1) 'positron)
              (symbol=? (particle-type p2) 'photon)) 'positron]
        [(and (symbol=? (particle-type p1) 'photon)
              (symbol=? (particle-type p2) 'positron)) 'positron]
        ))

;;(energy p1 p2) produces the energy level of the emitted particle.
;;energy: particle particle ---> Int
;;      Int must be >= 0
;;Example:
(check-expect (energy (make-particle 'electron 2.4) (make-particle 'positron 2.4)) 4.8)

(define (energy p1 p2)
  (+ (particle-energy p1) (particle-energy p2)))

;;(collide p1 p2) produces the type of particles emitted, as well
;;       as the energy of the emitted particle.
;;collide: particle particle ---> particle
;;Example:
(check-expect (collide (make-particle 'electron 2.4) (make-particle 'positron 2.4)) (make-particle 'photon 4.8))

(define (collide p1 p2)
  (make-particle (cond
        [(symbol=? (type p1 p2) 'photon) 'photon]
        [(symbol=? (type p1 p2) 'electron) 'electron]
        [(symbol=? (type p1 p2) 'positron) 'positron]
        )
  (energy p1 p2)))

;;Tests
(check-expect (collide (make-particle 'electron 2.4) (make-particle 'positron 2.4)) (make-particle 'photon 4.8))
(check-expect (collide (make-particle 'positron 2.4) (make-particle 'electron 2.4)) (make-particle 'photon 4.8))
(check-expect (collide (make-particle 'electron 2.4) (make-particle 'photon 2.4)) (make-particle 'electron 4.8))
(check-expect (collide (make-particle 'photon 2.4) (make-particle 'electron 2.4)) (make-particle 'electron 4.8))
(check-expect (collide (make-particle 'photon 2.4) (make-particle 'positron 2.4)) (make-particle 'positron 4.8))
(check-expect (collide (make-particle 'positron 2.4) (make-particle 'photon 2.4)) (make-particle 'positron 4.8))
(check-expect (collide (make-particle 'photon 0) (make-particle 'positron 2.4)) (make-particle 'positron 2.4))
(check-expect (collide (make-particle 'positron 2.4) (make-particle 'photon 0)) (make-particle 'positron 2.4))
(check-expect (collide (make-particle 'photon 2.4) (make-particle 'positron 2.4)) (make-particle 'positron 4.8))
(check-expect (collide (make-particle 'positron 0) (make-particle 'photon 0)) (make-particle 'positron 0))
(check-expect (type (make-particle 'electron 2.4) (make-particle 'positron 2.4)) 'photon)
(check-expect (type (make-particle 'positron 2.4) (make-particle 'electron 2.4)) 'photon)
(check-expect (type (make-particle 'electron 2.4) (make-particle 'photon 2.4)) 'electron)
(check-expect (type (make-particle 'photon 2.4) (make-particle 'electron 2.4)) 'electron)
(check-expect (type (make-particle 'photon 2.4) (make-particle 'positron 2.4)) 'positron)
(check-expect (type (make-particle 'positron 2.4) (make-particle 'photon 2.4)) 'positron)
(check-expect (energy (make-particle 'electron 2.4) (make-particle 'positron 2.4)) 4.8)
(check-expect (energy (make-particle 'electron 1.2) (make-particle 'positron 2.4)) 3.6)
(check-expect (energy (make-particle 'electron 2.4) (make-particle 'positron 1.2)) 3.6)
(check-expect (energy (make-particle 'electron 0) (make-particle 'positron 2.4)) 2.4)
(check-expect (energy (make-particle 'electron 2.4) (make-particle 'positron 0)) 2.4)
(check-expect (energy (make-particle 'electron 0) (make-particle 'positron 0)) 0)