import { Suspense } from 'react'
import Success from './Success'

export default function SuccessPage() {
  return (
    <Suspense fallback={<div>Loading...</div>}>
      <Success />
    </Suspense>
  )
}