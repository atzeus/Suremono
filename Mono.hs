{-# LANGUAGE Rank2Types #-}
module Mono(Mono,MonoM, newMono, runMono) where

-- Claim: using this interface (meaning excluding the constructors),
-- there is no term we can form, such that a subterm (other than undefined) has type 
-- type (forall x. Mono s x) where f is some type function. 
-- This is the reason that STRefs (and IORefs) 
-- are type-safe: references are monomorphic.

-- Note that if the Mono constructor was exported
-- we could easily make a value of type (forall x. Mono s x),
-- it is the type of the constructor

data Mono s a = Mono -- constructor not exported

newtype MonoM s a = MonoM a -- constructor not exported
   deriving (Functor,Applicative,Monad,MonadFix)

newMono :: MonoM s (Mono s a)
newMono = MonoM Mono

runMono :: (forall s. MonoM s a) -> a
runMono (MonoM x) x



