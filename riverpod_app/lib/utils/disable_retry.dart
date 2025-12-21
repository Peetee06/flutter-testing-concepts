/// Disables automatic retry for providers in tests.
/// Returns null to disable retry entirely.
Duration? disableRetry(int retryCount, Object error) => null;
