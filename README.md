# bayt_finder

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
-------------------------------------
Translated Report (Full Report Below)
-------------------------------------

Incident Identifier: 599D4676-33BD-4DAE-AF68-483DBF6D32B2
CrashReporter Key:   A1104BEF-E4D7-EDF6-B418-E95438926C71
Hardware Model:      Macmini9,1
Process:             Runner [29578]
Path:                /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Runner
Identifier:          com.nahr.baytFinder
Version:             1.0.0 (1)
Code Type:           ARM-64 (Native)
Role:                Foreground
Parent Process:      launchd_sim [21006]
Coalition:           com.apple.CoreSimulator.SimDevice.56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD [29720]
Responsible Process: SimulatorTrampoline [656]

Date/Time:           2025-03-30 05:34:11.2569 +0200
Launch Time:         2025-03-30 05:33:48.5086 +0200
OS Version:          macOS 14.6.1 (23G93)
Release Type:        User
Report Version:      104

Exception Type:  EXC_CRASH (SIGABRT)
Exception Codes: 0x0000000000000000, 0x0000000000000000
Termination Reason: SIGNAL 6 Abort trap: 6
Terminating Process: Runner [29578]

Triggered by Thread:  0

Last Exception Backtrace:
0   CoreFoundation                	       0x1804b9100 __exceptionPreprocess + 160
1   libobjc.A.dylib               	       0x180092da8 objc_exception_throw + 72
2   CoreFoundation                	       0x1804b901c -[NSException initWithCoder:] + 0
3   Runner.debug.dylib            	       0x1043aaca0 +[GMSServices checkServicePreconditions] + 260
4   Runner.debug.dylib            	       0x1043a8a60 +[GMSServices preLaunchServices] + 112
5   Runner.debug.dylib            	       0x104b54b90 -[FLTGoogleMapFactory sharedMapServices] + 60
6   Runner.debug.dylib            	       0x104b54ac0 -[FLTGoogleMapFactory createWithFrame:viewIdentifier:arguments:] + 84
7   Flutter                       	       0x108b48a24 flutter::PlatformViewsController::OnCreate(FlutterMethodCall*, void (objc_object*) block_pointer) + 796
8   Flutter                       	       0x108b485a4 flutter::PlatformViewsController::OnMethodCall(FlutterMethodCall*, void (objc_object*) block_pointer) + 140
9   Flutter                       	       0x10911f060 __45-[FlutterMethodChannel setMethodCallHandler:]_block_invoke + 164
10  Flutter                       	       0x108b56c40 invocation function for block in flutter::PlatformMessageHandlerIos::HandlePlatformMessage(std::_fl::unique_ptr<flutter::PlatformMessage, std::_fl::default_delete<flutter::PlatformMessage>>) + 108
11  libdispatch.dylib             	       0x18017b314 _dispatch_call_block_and_release + 24
12  libdispatch.dylib             	       0x18017cc08 _dispatch_client_callout + 16
13  libdispatch.dylib             	       0x18018bc2c _dispatch_main_queue_drain + 1276
14  libdispatch.dylib             	       0x18018b720 _dispatch_main_queue_callback_4CF + 40
15  CoreFoundation                	       0x18041cdac __CFRUNLOOP_IS_SERVICING_THE_MAIN_DISPATCH_QUEUE__ + 12
16  CoreFoundation                	       0x180417308 __CFRunLoopRun + 1944
17  CoreFoundation                	       0x1804166f4 CFRunLoopRunSpecific + 552
18  GraphicsServices              	       0x1905e5b10 GSEventRunModal + 160
19  UIKitCore                     	       0x185b319dc -[UIApplication _run] + 796
20  UIKitCore                     	       0x185b35bd4 UIApplicationMain + 124
21  UIKitCore                     	       0x184f0a334 0x184cd3000 + 2323252
22  Runner.debug.dylib            	       0x10437e80c static UIApplicationDelegate.main() + 120
23  Runner.debug.dylib            	       0x10437e784 static AppDelegate.$main() + 44
24  Runner.debug.dylib            	       0x10437e888 __debug_main_executable_dylib_entry_point + 28 (AppDelegate.swift:4)
25  dyld_sim                      	       0x102911410 start_sim + 20
26  dyld                          	       0x10228a154 start + 2476
27  ???                           	0x9530800000000000 ???

Thread 0 Crashed::  Dispatch queue: com.apple.main-thread
0   libsystem_kernel.dylib        	       0x103c68f30 __pthread_kill + 8
1   libsystem_pthread.dylib       	       0x10412f124 pthread_kill + 256
2   libsystem_c.dylib             	       0x1801704ec abort + 104
3   libc++abi.dylib               	       0x1802ad100 abort_message + 128
4   libc++abi.dylib               	       0x18029cb04 demangling_terminate_handler() + 300
5   libobjc.A.dylib               	       0x18006f8ac _objc_terminate() + 124
6   libc++abi.dylib               	       0x1802ac4d8 std::__terminate(void (*)()) + 12
7   libc++abi.dylib               	       0x1802ac488 std::terminate() + 52
8   libdispatch.dylib             	       0x18017cc1c _dispatch_client_callout + 36
9   libdispatch.dylib             	       0x18018bc2c _dispatch_main_queue_drain + 1276
10  libdispatch.dylib             	       0x18018b720 _dispatch_main_queue_callback_4CF + 40
11  CoreFoundation                	       0x18041cdac __CFRUNLOOP_IS_SERVICING_THE_MAIN_DISPATCH_QUEUE__ + 12
12  CoreFoundation                	       0x180417308 __CFRunLoopRun + 1944
13  CoreFoundation                	       0x1804166f4 CFRunLoopRunSpecific + 552
14  GraphicsServices              	       0x1905e5b10 GSEventRunModal + 160
15  UIKitCore                     	       0x185b319dc -[UIApplication _run] + 796
16  UIKitCore                     	       0x185b35bd4 UIApplicationMain + 124
17  UIKitCore                     	       0x184f0a334 0x184cd3000 + 2323252
18  Runner.debug.dylib            	       0x10437e80c static UIApplicationDelegate.main() + 120
19  Runner.debug.dylib            	       0x10437e784 static AppDelegate.$main() + 44
20  Runner.debug.dylib            	       0x10437e888 __debug_main_executable_dylib_entry_point + 28 (AppDelegate.swift:4)
21  dyld_sim                      	       0x102911410 start_sim + 20
22  dyld                          	       0x10228a154 start + 2476

Thread 1:
0   libsystem_pthread.dylib       	       0x10412a5cc start_wqthread + 0

Thread 2:: com.apple.uikit.eventfetch-thread
0   libsystem_kernel.dylib        	       0x103c61170 mach_msg2_trap + 8
1   libsystem_kernel.dylib        	       0x103c72660 mach_msg2_internal + 76
2   libsystem_kernel.dylib        	       0x103c69318 mach_msg_overwrite + 532
3   libsystem_kernel.dylib        	       0x103c614e8 mach_msg + 20
4   CoreFoundation                	       0x18041cad0 __CFRunLoopServiceMachPort + 156
5   CoreFoundation                	       0x180416ff8 __CFRunLoopRun + 1160
6   CoreFoundation                	       0x1804166f4 CFRunLoopRunSpecific + 552
7   Foundation                    	       0x180f1f438 -[NSRunLoop(NSRunLoop) runMode:beforeDate:] + 208
8   Foundation                    	       0x180f1f658 -[NSRunLoop(NSRunLoop) runUntilDate:] + 60
9   UIKitCore                     	       0x185bdf284 -[UIEventFetcher threadMain] + 404
10  Foundation                    	       0x180f46280 __NSThread__start__ + 720
11  libsystem_pthread.dylib       	       0x10412f414 _pthread_start + 104
12  libsystem_pthread.dylib       	       0x10412a5e0 thread_start + 8

Thread 3:
0   libsystem_pthread.dylib       	       0x10412a5cc start_wqthread + 0

Thread 4:: io.flutter.1.ui
0   libsystem_kernel.dylib        	       0x103c61170 mach_msg2_trap + 8
1   libsystem_kernel.dylib        	       0x103c72660 mach_msg2_internal + 76
2   libsystem_kernel.dylib        	       0x103c69318 mach_msg_overwrite + 532
3   libsystem_kernel.dylib        	       0x103c614e8 mach_msg + 20
4   CoreFoundation                	       0x18041cad0 __CFRunLoopServiceMachPort + 156
5   CoreFoundation                	       0x180416ff8 __CFRunLoopRun + 1160
6   CoreFoundation                	       0x1804166f4 CFRunLoopRunSpecific + 552
7   Flutter                       	       0x108b7f7c4 fml::MessageLoopDarwin::Run() + 88
8   Flutter                       	       0x108b786d4 fml::MessageLoopImpl::DoRun() + 40
9   Flutter                       	       0x108b7e470 std::_fl::__function::__func<fml::Thread::Thread(std::_fl::function<void (fml::Thread::ThreadConfig const&)> const&, fml::Thread::ThreadConfig const&)::$_0, std::_fl::allocator<fml::Thread::Thread(std::_fl::function<void (fml::Thread::ThreadConfig const&)> const&, fml::Thread::ThreadConfig const&)::$_0>, void ()>::operator()() + 184
10  Flutter                       	       0x108b7e17c fml::ThreadHandle::ThreadHandle(std::_fl::function<void ()>&&)::$_0::__invoke(void*) + 36
11  libsystem_pthread.dylib       	       0x10412f414 _pthread_start + 104
12  libsystem_pthread.dylib       	       0x10412a5e0 thread_start + 8

Thread 5:: io.flutter.1.raster
0   libsystem_kernel.dylib        	       0x103c61170 mach_msg2_trap + 8
1   libsystem_kernel.dylib        	       0x103c72660 mach_msg2_internal + 76
2   libsystem_kernel.dylib        	       0x103c69318 mach_msg_overwrite + 532
3   libsystem_kernel.dylib        	       0x103c614e8 mach_msg + 20
4   CoreFoundation                	       0x18041cad0 __CFRunLoopServiceMachPort + 156
5   CoreFoundation                	       0x180416ff8 __CFRunLoopRun + 1160
6   CoreFoundation                	       0x1804166f4 CFRunLoopRunSpecific + 552
7   Flutter                       	       0x108b7f7c4 fml::MessageLoopDarwin::Run() + 88
8   Flutter                       	       0x108b786d4 fml::MessageLoopImpl::DoRun() + 40
9   Flutter                       	       0x108b7e470 std::_fl::__function::__func<fml::Thread::Thread(std::_fl::function<void (fml::Thread::ThreadConfig const&)> const&, fml::Thread::ThreadConfig const&)::$_0, std::_fl::allocator<fml::Thread::Thread(std::_fl::function<void (fml::Thread::ThreadConfig const&)> const&, fml::Thread::ThreadConfig const&)::$_0>, void ()>::operator()() + 184
10  Flutter                       	       0x108b7e17c fml::ThreadHandle::ThreadHandle(std::_fl::function<void ()>&&)::$_0::__invoke(void*) + 36
11  libsystem_pthread.dylib       	       0x10412f414 _pthread_start + 104
12  libsystem_pthread.dylib       	       0x10412a5e0 thread_start + 8

Thread 6:: io.flutter.1.io
0   libsystem_kernel.dylib        	       0x103c61170 mach_msg2_trap + 8
1   libsystem_kernel.dylib        	       0x103c72660 mach_msg2_internal + 76
2   libsystem_kernel.dylib        	       0x103c69318 mach_msg_overwrite + 532
3   libsystem_kernel.dylib        	       0x103c614e8 mach_msg + 20
4   CoreFoundation                	       0x18041cad0 __CFRunLoopServiceMachPort + 156
5   CoreFoundation                	       0x180416ff8 __CFRunLoopRun + 1160
6   CoreFoundation                	       0x1804166f4 CFRunLoopRunSpecific + 552
7   Flutter                       	       0x108b7f7c4 fml::MessageLoopDarwin::Run() + 88
8   Flutter                       	       0x108b786d4 fml::MessageLoopImpl::DoRun() + 40
9   Flutter                       	       0x108b7e470 std::_fl::__function::__func<fml::Thread::Thread(std::_fl::function<void (fml::Thread::ThreadConfig const&)> const&, fml::Thread::ThreadConfig const&)::$_0, std::_fl::allocator<fml::Thread::Thread(std::_fl::function<void (fml::Thread::ThreadConfig const&)> const&, fml::Thread::ThreadConfig const&)::$_0>, void ()>::operator()() + 184
10  Flutter                       	       0x108b7e17c fml::ThreadHandle::ThreadHandle(std::_fl::function<void ()>&&)::$_0::__invoke(void*) + 36
11  libsystem_pthread.dylib       	       0x10412f414 _pthread_start + 104
12  libsystem_pthread.dylib       	       0x10412a5e0 thread_start + 8

Thread 7:: io.flutter.1.profiler
0   libsystem_kernel.dylib        	       0x103c61170 mach_msg2_trap + 8
1   libsystem_kernel.dylib        	       0x103c72660 mach_msg2_internal + 76
2   libsystem_kernel.dylib        	       0x103c69318 mach_msg_overwrite + 532
3   libsystem_kernel.dylib        	       0x103c614e8 mach_msg + 20
4   CoreFoundation                	       0x18041cad0 __CFRunLoopServiceMachPort + 156
5   CoreFoundation                	       0x180416ff8 __CFRunLoopRun + 1160
6   CoreFoundation                	       0x1804166f4 CFRunLoopRunSpecific + 552
7   Flutter                       	       0x108b7f7c4 fml::MessageLoopDarwin::Run() + 88
8   Flutter                       	       0x108b786d4 fml::MessageLoopImpl::DoRun() + 40
9   Flutter                       	       0x108b7e470 std::_fl::__function::__func<fml::Thread::Thread(std::_fl::function<void (fml::Thread::ThreadConfig const&)> const&, fml::Thread::ThreadConfig const&)::$_0, std::_fl::allocator<fml::Thread::Thread(std::_fl::function<void (fml::Thread::ThreadConfig const&)> const&, fml::Thread::ThreadConfig const&)::$_0>, void ()>::operator()() + 184
10  Flutter                       	       0x108b7e17c fml::ThreadHandle::ThreadHandle(std::_fl::function<void ()>&&)::$_0::__invoke(void*) + 36
11  libsystem_pthread.dylib       	       0x10412f414 _pthread_start + 104
12  libsystem_pthread.dylib       	       0x10412a5e0 thread_start + 8

Thread 8:: io.worker.1
0   libsystem_kernel.dylib        	       0x103c64670 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x10412f9cc _pthread_cond_wait + 1216
2   Flutter                       	       0x108b5834c std::_fl::condition_variable::wait(std::_fl::unique_lock<std::_fl::mutex>&) + 24
3   Flutter                       	       0x108b74b04 fml::ConcurrentMessageLoop::WorkerMain() + 128
4   Flutter                       	       0x108b753dc void* std::_fl::__thread_proxy[abi:v15000]<std::_fl::tuple<std::_fl::unique_ptr<std::_fl::__thread_struct, std::_fl::default_delete<std::_fl::__thread_struct>>, fml::ConcurrentMessageLoop::ConcurrentMessageLoop(unsigned long)::$_0>>(void*) + 184
5   libsystem_pthread.dylib       	       0x10412f414 _pthread_start + 104
6   libsystem_pthread.dylib       	       0x10412a5e0 thread_start + 8

Thread 9:: io.worker.2
0   libsystem_kernel.dylib        	       0x103c64670 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x10412f9cc _pthread_cond_wait + 1216
2   Flutter                       	       0x108b5834c std::_fl::condition_variable::wait(std::_fl::unique_lock<std::_fl::mutex>&) + 24
3   Flutter                       	       0x108b74b04 fml::ConcurrentMessageLoop::WorkerMain() + 128
4   Flutter                       	       0x108b753dc void* std::_fl::__thread_proxy[abi:v15000]<std::_fl::tuple<std::_fl::unique_ptr<std::_fl::__thread_struct, std::_fl::default_delete<std::_fl::__thread_struct>>, fml::ConcurrentMessageLoop::ConcurrentMessageLoop(unsigned long)::$_0>>(void*) + 184
5   libsystem_pthread.dylib       	       0x10412f414 _pthread_start + 104
6   libsystem_pthread.dylib       	       0x10412a5e0 thread_start + 8

Thread 10:: io.worker.3
0   libsystem_kernel.dylib        	       0x103c64670 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x10412f9cc _pthread_cond_wait + 1216
2   Flutter                       	       0x108b5834c std::_fl::condition_variable::wait(std::_fl::unique_lock<std::_fl::mutex>&) + 24
3   Flutter                       	       0x108b74b04 fml::ConcurrentMessageLoop::WorkerMain() + 128
4   Flutter                       	       0x108b753dc void* std::_fl::__thread_proxy[abi:v15000]<std::_fl::tuple<std::_fl::unique_ptr<std::_fl::__thread_struct, std::_fl::default_delete<std::_fl::__thread_struct>>, fml::ConcurrentMessageLoop::ConcurrentMessageLoop(unsigned long)::$_0>>(void*) + 184
5   libsystem_pthread.dylib       	       0x10412f414 _pthread_start + 104
6   libsystem_pthread.dylib       	       0x10412a5e0 thread_start + 8

Thread 11:: io.worker.4
0   libsystem_kernel.dylib        	       0x103c64670 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x10412f9cc _pthread_cond_wait + 1216
2   Flutter                       	       0x108b5834c std::_fl::condition_variable::wait(std::_fl::unique_lock<std::_fl::mutex>&) + 24
3   Flutter                       	       0x108b74b04 fml::ConcurrentMessageLoop::WorkerMain() + 128
4   Flutter                       	       0x108b753dc void* std::_fl::__thread_proxy[abi:v15000]<std::_fl::tuple<std::_fl::unique_ptr<std::_fl::__thread_struct, std::_fl::default_delete<std::_fl::__thread_struct>>, fml::ConcurrentMessageLoop::ConcurrentMessageLoop(unsigned long)::$_0>>(void*) + 184
5   libsystem_pthread.dylib       	       0x10412f414 _pthread_start + 104
6   libsystem_pthread.dylib       	       0x10412a5e0 thread_start + 8

Thread 12:: dart:io EventHandler
0   libsystem_kernel.dylib        	       0x103c66cec kevent + 8
1   Flutter                       	       0x1090cc3a8 dart::bin::EventHandlerImplementation::EventHandlerEntry(unsigned long) + 300
2   Flutter                       	       0x1090e861c dart::bin::ThreadStart(void*) + 88
3   libsystem_pthread.dylib       	       0x10412f414 _pthread_start + 104
4   libsystem_pthread.dylib       	       0x10412a5e0 thread_start + 8

Thread 13:: Dart Profiler ThreadInterrupter
0   libsystem_kernel.dylib        	       0x103c64670 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x10412f9f8 _pthread_cond_wait + 1260
2   Flutter                       	       0x109145bc4 dart::ConditionVariable::WaitMicros(dart::Mutex*, long long) + 112
3   Flutter                       	       0x1092c6cf8 dart::ThreadInterrupter::ThreadMain(unsigned long) + 328
4   Flutter                       	       0x109258d3c dart::ThreadStart(void*) + 204
5   libsystem_pthread.dylib       	       0x10412f414 _pthread_start + 104
6   libsystem_pthread.dylib       	       0x10412a5e0 thread_start + 8

Thread 14:: Dart Profiler SampleBlockProcessor
0   libsystem_kernel.dylib        	       0x103c64670 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x10412f9f8 _pthread_cond_wait + 1260
2   Flutter                       	       0x109145bc4 dart::ConditionVariable::WaitMicros(dart::Mutex*, long long) + 112
3   Flutter                       	       0x10925d7dc dart::SampleBlockProcessor::ThreadMain(unsigned long) + 292
4   Flutter                       	       0x109258d3c dart::ThreadStart(void*) + 204
5   libsystem_pthread.dylib       	       0x10412f414 _pthread_start + 104
6   libsystem_pthread.dylib       	       0x10412a5e0 thread_start + 8

Thread 15:: DartWorker
0   Flutter                       	       0x1092f19e0 dart::MarkingVisitorBase<true>::VisitPointers(dart::ObjectPtr*, dart::ObjectPtr*) + 224
1   Flutter                       	       0x1092660e8 dart::UntaggedObject::VisitPointersPredefined(dart::ObjectPointerVisitor*, long) + 1196
2   Flutter                       	       0x1092f1eac dart::MarkingVisitorBase<true>::DrainMarkingStackWithPauseChecks() + 464
3   Flutter                       	       0x1092f1c0c dart::ConcurrentMarkTask::Run() + 116
4   Flutter                       	       0x1092c7964 dart::ThreadPool::WorkerLoop(dart::ThreadPool::Worker*) + 268
5   Flutter                       	       0x1092c7bac dart::ThreadPool::Worker::Main(unsigned long) + 116
6   Flutter                       	       0x109258d3c dart::ThreadStart(void*) + 204
7   libsystem_pthread.dylib       	       0x10412f414 _pthread_start + 104
8   libsystem_pthread.dylib       	       0x10412a5e0 thread_start + 8

Thread 16:: DartWorker
0   Flutter                       	       0x1092f19e0 dart::MarkingVisitorBase<true>::VisitPointers(dart::ObjectPtr*, dart::ObjectPtr*) + 224
1   Flutter                       	       0x109266520 dart::UntaggedObjectPool::VisitObjectPoolPointers(dart::ObjectPoolPtr, dart::ObjectPointerVisitor*) + 104
2   Flutter                       	       0x1092f1eac dart::MarkingVisitorBase<true>::DrainMarkingStackWithPauseChecks() + 464
3   Flutter                       	       0x1092f1c0c dart::ConcurrentMarkTask::Run() + 116
4   Flutter                       	       0x1092c7964 dart::ThreadPool::WorkerLoop(dart::ThreadPool::Worker*) + 268
5   Flutter                       	       0x1092c7bac dart::ThreadPool::Worker::Main(unsigned long) + 116
6   Flutter                       	       0x109258d3c dart::ThreadStart(void*) + 204
7   libsystem_pthread.dylib       	       0x10412f414 _pthread_start + 104
8   libsystem_pthread.dylib       	       0x10412a5e0 thread_start + 8

Thread 17:: DartWorker
0   libsystem_kernel.dylib        	       0x103c64670 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x10412f9f8 _pthread_cond_wait + 1260
2   Flutter                       	       0x109145bc4 dart::ConditionVariable::WaitMicros(dart::Mutex*, long long) + 112
3   Flutter                       	       0x1092c7a54 dart::ThreadPool::WorkerLoop(dart::ThreadPool::Worker*) + 508
4   Flutter                       	       0x1092c7bac dart::ThreadPool::Worker::Main(unsigned long) + 116
5   Flutter                       	       0x109258d3c dart::ThreadStart(void*) + 204
6   libsystem_pthread.dylib       	       0x10412f414 _pthread_start + 104
7   libsystem_pthread.dylib       	       0x10412a5e0 thread_start + 8

Thread 18:: AXSpeech
0   libsystem_kernel.dylib        	       0x103c61170 mach_msg2_trap + 8
1   libsystem_kernel.dylib        	       0x103c72660 mach_msg2_internal + 76
2   libsystem_kernel.dylib        	       0x103c69318 mach_msg_overwrite + 532
3   libsystem_kernel.dylib        	       0x103c614e8 mach_msg + 20
4   CoreFoundation                	       0x18041cad0 __CFRunLoopServiceMachPort + 156
5   CoreFoundation                	       0x180416ff8 __CFRunLoopRun + 1160
6   CoreFoundation                	       0x1804166f4 CFRunLoopRunSpecific + 552
7   Foundation                    	       0x180f1f438 -[NSRunLoop(NSRunLoop) runMode:beforeDate:] + 208
8   TextToSpeech                  	       0x1b60f88dc 0x1b60ce000 + 174300
9   Foundation                    	       0x180f46280 __NSThread__start__ + 720
10  libsystem_pthread.dylib       	       0x10412f414 _pthread_start + 104
11  libsystem_pthread.dylib       	       0x10412a5e0 thread_start + 8

Thread 19:: DartWorker
0   libsystem_kernel.dylib        	       0x103c64670 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x10412f9f8 _pthread_cond_wait + 1260
2   Flutter                       	       0x109145bc4 dart::ConditionVariable::WaitMicros(dart::Mutex*, long long) + 112
3   Flutter                       	       0x1091a3410 dart::MutatorThreadPool::OnEnterIdleLocked(dart::MutexLocker*, dart::ThreadPool::Worker*) + 152
4   Flutter                       	       0x1092c78d4 dart::ThreadPool::WorkerLoop(dart::ThreadPool::Worker*) + 124
5   Flutter                       	       0x1092c7bac dart::ThreadPool::Worker::Main(unsigned long) + 116
6   Flutter                       	       0x109258d3c dart::ThreadStart(void*) + 204
7   libsystem_pthread.dylib       	       0x10412f414 _pthread_start + 104
8   libsystem_pthread.dylib       	       0x10412a5e0 thread_start + 8

Thread 20:
0   libsystem_pthread.dylib       	       0x10412a5cc start_wqthread + 0

Thread 21:
0   libsystem_pthread.dylib       	       0x10412a5cc start_wqthread + 0

Thread 22:: com.apple.NSURLConnectionLoader
0   libsystem_kernel.dylib        	       0x103c61170 mach_msg2_trap + 8
1   libsystem_kernel.dylib        	       0x103c72660 mach_msg2_internal + 76
2   libsystem_kernel.dylib        	       0x103c69318 mach_msg_overwrite + 532
3   libsystem_kernel.dylib        	       0x103c614e8 mach_msg + 20
4   CoreFoundation                	       0x18041cad0 __CFRunLoopServiceMachPort + 156
5   CoreFoundation                	       0x180416ff8 __CFRunLoopRun + 1160
6   CoreFoundation                	       0x1804166f4 CFRunLoopRunSpecific + 552
7   CFNetwork                     	       0x184a03d64 +[__CFN_CoreSchedulingSetRunnable _run:] + 372
8   Foundation                    	       0x180f46280 __NSThread__start__ + 720
9   libsystem_pthread.dylib       	       0x10412f414 _pthread_start + 104
10  libsystem_pthread.dylib       	       0x10412a5e0 thread_start + 8

Thread 23:: DartWorker
0   libsystem_kernel.dylib        	       0x103c64670 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x10412f9f8 _pthread_cond_wait + 1260
2   Flutter                       	       0x109145bc4 dart::ConditionVariable::WaitMicros(dart::Mutex*, long long) + 112
3   Flutter                       	       0x1092c7a54 dart::ThreadPool::WorkerLoop(dart::ThreadPool::Worker*) + 508
4   Flutter                       	       0x1092c7bac dart::ThreadPool::Worker::Main(unsigned long) + 116
5   Flutter                       	       0x109258d3c dart::ThreadStart(void*) + 204
6   libsystem_pthread.dylib       	       0x10412f414 _pthread_start + 104
7   libsystem_pthread.dylib       	       0x10412a5e0 thread_start + 8

Thread 24:: DartWorker
0   libsystem_kernel.dylib        	       0x103c64670 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x10412f9f8 _pthread_cond_wait + 1260
2   Flutter                       	       0x109145bc4 dart::ConditionVariable::WaitMicros(dart::Mutex*, long long) + 112
3   Flutter                       	       0x1092c7a54 dart::ThreadPool::WorkerLoop(dart::ThreadPool::Worker*) + 508
4   Flutter                       	       0x1092c7bac dart::ThreadPool::Worker::Main(unsigned long) + 116
5   Flutter                       	       0x109258d3c dart::ThreadStart(void*) + 204
6   libsystem_pthread.dylib       	       0x10412f414 _pthread_start + 104
7   libsystem_pthread.dylib       	       0x10412a5e0 thread_start + 8

Thread 25:: DartWorker
0   libsystem_kernel.dylib        	       0x103c64670 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x10412f9f8 _pthread_cond_wait + 1260
2   Flutter                       	       0x109145bc4 dart::ConditionVariable::WaitMicros(dart::Mutex*, long long) + 112
3   Flutter                       	       0x1092c7a54 dart::ThreadPool::WorkerLoop(dart::ThreadPool::Worker*) + 508
4   Flutter                       	       0x1092c7bac dart::ThreadPool::Worker::Main(unsigned long) + 116
5   Flutter                       	       0x109258d3c dart::ThreadStart(void*) + 204
6   libsystem_pthread.dylib       	       0x10412f414 _pthread_start + 104
7   libsystem_pthread.dylib       	       0x10412a5e0 thread_start + 8

Thread 26:: DartWorker
0   libsystem_kernel.dylib        	       0x103c64670 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x10412f9f8 _pthread_cond_wait + 1260
2   Flutter                       	       0x109145bc4 dart::ConditionVariable::WaitMicros(dart::Mutex*, long long) + 112
3   Flutter                       	       0x1092c7a54 dart::ThreadPool::WorkerLoop(dart::ThreadPool::Worker*) + 508
4   Flutter                       	       0x1092c7bac dart::ThreadPool::Worker::Main(unsigned long) + 116
5   Flutter                       	       0x109258d3c dart::ThreadStart(void*) + 204
6   libsystem_pthread.dylib       	       0x10412f414 _pthread_start + 104
7   libsystem_pthread.dylib       	       0x10412a5e0 thread_start + 8

Thread 27:: DartWorker
0   libsystem_kernel.dylib        	       0x103c64670 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x10412f9f8 _pthread_cond_wait + 1260
2   Flutter                       	       0x109145bc4 dart::ConditionVariable::WaitMicros(dart::Mutex*, long long) + 112
3   Flutter                       	       0x1092c7a54 dart::ThreadPool::WorkerLoop(dart::ThreadPool::Worker*) + 508
4   Flutter                       	       0x1092c7bac dart::ThreadPool::Worker::Main(unsigned long) + 116
5   Flutter                       	       0x109258d3c dart::ThreadStart(void*) + 204
6   libsystem_pthread.dylib       	       0x10412f414 _pthread_start + 104
7   libsystem_pthread.dylib       	       0x10412a5e0 thread_start + 8

Thread 28:
0   libsystem_pthread.dylib       	       0x10412a5cc start_wqthread + 0


Thread 0 crashed with ARM Thread State (64-bit):
    x0: 0x0000000000000000   x1: 0x0000000000000000   x2: 0x0000000000000000   x3: 0x0000000000000000
    x4: 0x00000001802b0dd7   x5: 0x000000016dc71030   x6: 0x000000000000006e   x7: 0x0000000000000000
    x8: 0x000000010231c240   x9: 0x636565aa4e020b8a  x10: 0x0000000000000051  x11: 0x000000000000000b
   x12: 0x000000000000000b  x13: 0x00000001806c1dce  x14: 0x00000000000007fb  x15: 0x000000009d81f034
   x16: 0x0000000000000148  x17: 0x000000009da1e839  x18: 0x0000000000000000  x19: 0x0000000000000006
   x20: 0x000000010231c240  x21: 0x0000000000000103  x22: 0x000000010231c320  x23: 0x0000000000000114
   x24: 0x0000600001786f00  x25: 0x0000600001786f00  x26: 0x0000000000000000  x27: 0x0000000000000000
   x28: 0x0000000000000000   fp: 0x000000016dc70fa0   lr: 0x000000010412f124
    sp: 0x000000016dc70f80   pc: 0x0000000103c68f30 cpsr: 0x40001000
   far: 0x0000000000000000  esr: 0x56000080  Address size fault

Binary Images:
       0x102284000 -        0x10230ffff dyld (*) <f635824e-318b-3f0c-842c-c369737f2b68> /usr/lib/dyld
       0x10218c000 -        0x10218ffff com.nahr.baytFinder (1.0.0) <a3edbe5a-2cdd-30fb-bc28-1023668379c8> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Runner
       0x102910000 -        0x102953fff dyld_sim (*) <e71713fd-bf2a-3d11-a0e8-94488ca5d57a> /Volumes/VOLUME/*/dyld_sim
       0x104378000 -        0x104e9ffff Runner.debug.dylib (*) <a85f987e-4f37-34e4-acd2-901a4da894a8> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Runner.debug.dylib
       0x102220000 -        0x102233fff org.cocoapods.FBLPromises (2.4.0) <8c90eba0-7a26-3898-97ba-d42c94491af6> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/FBLPromises.framework/FBLPromises
       0x102200000 -        0x102203fff org.cocoapods.FirebaseAppCheckInterop (11.10.0) <5681973f-9eed-3b03-9669-7b081cad16ce> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/FirebaseAppCheckInterop.framework/FirebaseAppCheckInterop
       0x103184000 -        0x10330bfff org.cocoapods.FirebaseAuth (11.8.1) <4a0a9ab8-efdd-3478-8cdd-4392d976a3ee> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/FirebaseAuth.framework/FirebaseAuth
       0x102254000 -        0x102257fff org.cocoapods.FirebaseAuthInterop (11.10.0) <416b7e45-e496-3bcc-8194-ddaae799ecbf> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/FirebaseAuthInterop.framework/FirebaseAuthInterop
       0x1027ac000 -        0x1027bffff org.cocoapods.FirebaseCore (11.8.1) <d3ffb4de-9470-30ec-87cc-f9aacf067a18> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/FirebaseCore.framework/FirebaseCore
       0x102268000 -        0x10226bfff org.cocoapods.FirebaseCoreExtension (11.8.0) <ef1f7b91-4ca2-302f-b8c2-26bfa8948595> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/FirebaseCoreExtension.framework/FirebaseCoreExtension
       0x102858000 -        0x10287ffff org.cocoapods.FirebaseCoreInternal (11.8.0) <e845c143-efee-3c0d-ba3c-cb1c4aa05316> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/FirebaseCoreInternal.framework/FirebaseCoreInternal
       0x1028cc000 -        0x1028e7fff org.cocoapods.FirebaseInstallations (11.8.0) <cf78da5d-8deb-383f-923d-9347168daa79> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/FirebaseInstallations.framework/FirebaseInstallations
       0x102e6c000 -        0x102eaffff org.cocoapods.FirebaseMessaging (11.8.0) <e1b7ae38-5d7d-3ba0-a8ae-60dc1c1017ea> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/FirebaseMessaging.framework/FirebaseMessaging
       0x102ddc000 -        0x102e2bfff org.cocoapods.GTMSessionFetcher (4.4.0) <6eda53d8-b327-3481-81ab-23049991a6c1> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/GTMSessionFetcher.framework/GTMSessionFetcher
       0x102ef8000 -        0x102f27fff org.cocoapods.GoogleDataTransport (10.1.0) <c4424e0f-3f58-337b-8de0-edc3b628a08f> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/GoogleDataTransport.framework/GoogleDataTransport
       0x102f64000 -        0x102f83fff org.cocoapods.GoogleUtilities (8.0.2) <a6dfb638-988f-39ff-8efd-8b49e7f583ff> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/GoogleUtilities.framework/GoogleUtilities
       0x102774000 -        0x10278ffff org.cocoapods.Mantle (2.2.0) <549f9a0c-2755-3e1f-916f-6394c8c04f2c> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/Mantle.framework/Mantle
       0x102814000 -        0x102827fff com.onesignal.OneSignalCore (1.0) <ee0ac3d0-a44d-36f9-84ec-f0decc83b2e2> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/OneSignalCore.framework/OneSignalCore
       0x102fac000 -        0x102fb7fff com.onesignal.OneSignalExtension (1.0) <7d3cfa19-6067-32fd-a393-679d40361abe> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/OneSignalExtension.framework/OneSignalExtension
       0x102fcc000 -        0x102fdffff com.onesignal.OneSignal-Dynamic (1.0) <607cbb39-fcb7-3092-b0f1-952d4eaf5d58> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/OneSignalFramework.framework/OneSignalFramework
       0x103058000 -        0x10307ffff com.onesignal.OneSignalInAppMessages (1.0) <1dd4a4c7-1945-382d-9777-c5e1ddd10686> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/OneSignalInAppMessages.framework/OneSignalInAppMessages
       0x1030b0000 -        0x1030d3fff com.onesignal.OneSignalLiveActivities (1.0) <d0b279a5-396a-34df-a92a-d802ef4b53cd> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/OneSignalLiveActivities.framework/OneSignalLiveActivities
       0x1021e8000 -        0x1021effff com.onesignal.OneSignalLocation (1.0) <19ff573a-c2fc-3192-a1e9-4676ce3557bd> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/OneSignalLocation.framework/OneSignalLocation
       0x102ffc000 -        0x10300bfff com.onesignal.OneSignalNotifications (1.0) <149aebfa-1aa9-3e23-b0eb-03c7214b61fa> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/OneSignalNotifications.framework/OneSignalNotifications
       0x103028000 -        0x10303ffff com.onesignal.OneSignalOSCore (1.0) <df21012a-48f9-3226-bbf4-00870676ba20> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/OneSignalOSCore.framework/OneSignalOSCore
       0x1030f4000 -        0x103107fff com.onesignal.OneSignalOutcomes (1.0) <cd64563b-9290-3d66-8c35-196d7a7c6005> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/OneSignalOutcomes.framework/OneSignalOutcomes
       0x1035a0000 -        0x1035ebfff com.onesignal.OneSignalUser (1.0) <84a3d275-7a6e-3089-9543-8251055f37f2> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/OneSignalUser.framework/OneSignalUser
       0x103124000 -        0x10312ffff org.cocoapods.OrderedSet (6.0.3) <3aeba7ba-aa1b-307d-97d7-aa1fd99e38d3> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/OrderedSet.framework/OrderedSet
       0x103718000 -        0x10378ffff org.cocoapods.PhoneNumberKit (3.8.0) <0011ee8c-52b6-381e-bfc3-81480e1b0d62> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/PhoneNumberKit.framework/PhoneNumberKit
       0x1027f8000 -        0x1027fbfff org.cocoapods.RecaptchaInterop (100.0.0) <e5c1127d-a4a8-3b98-937b-fb4ec4d4d5c9> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/RecaptchaInterop.framework/RecaptchaInterop
       0x103820000 -        0x10389ffff org.cocoapods.SDWebImage (5.21.0) <5deed453-e0e1-38da-ad1c-e4421e9cd163> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/SDWebImage.framework/SDWebImage
       0x10352c000 -        0x103537fff org.cocoapods.SDWebImageWebPCoder (0.14.6) <72480e7f-7c4a-35e6-921b-ec6be86ea1ac> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/SDWebImageWebPCoder.framework/SDWebImageWebPCoder
       0x103550000 -        0x10355ffff org.cocoapods.audio-session (0.0.1) <3cf49c99-8d57-318e-bce4-bc9a7fa0cd8f> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/audio_session.framework/audio_session
       0x103578000 -        0x103583fff org.cocoapods.connectivity-plus (0.0.1) <55d90f8a-3b45-3dd4-a63f-e426773f31b1> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/connectivity_plus.framework/connectivity_plus
       0x1027e0000 -        0x1027e7fff org.cocoapods.device-info-plus (0.0.1) <175f835e-ff96-3d5c-aabb-bedbdb086fb5> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/device_info_plus.framework/device_info_plus
       0x10367c000 -        0x10369ffff org.cocoapods.flutter-image-compress-common (1.0.0) <48155d77-5fd0-3d88-b30d-ea80d7aa5f96> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/flutter_image_compress_common.framework/flutter_image_compress_common
       0x103cd8000 -        0x103e8bfff org.cocoapods.flutter-inappwebview-ios (0.0.1) <39f95f3e-44f7-30dd-9e8d-6ce7a2825eb1> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/flutter_inappwebview_ios.framework/flutter_inappwebview_ios
       0x103610000 -        0x103617fff org.cocoapods.flutter-localization (0.0.1) <dc9b8515-8f94-3abe-a6e4-c1158c78d853> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/flutter_localization.framework/flutter_localization
       0x10362c000 -        0x103637fff org.cocoapods.fluttertoast (0.0.2) <a243ccb1-6206-3cc1-8a1d-ce16ca2807e8> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/fluttertoast.framework/fluttertoast
       0x103650000 -        0x103657fff org.cocoapods.geocoding-ios (1.0.5) <a547b692-98cd-39bd-bd73-c721ee75cdcb> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/geocoding_ios.framework/geocoding_ios
       0x1036e4000 -        0x1036effff org.cocoapods.geolocator-apple (1.2.0) <baeadef7-9499-3ae9-a06a-3cd4799a8d81> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/geolocator_apple.framework/geolocator_apple
       0x103920000 -        0x103933fff org.cocoapods.image-picker-ios (0.0.1) <d6138948-9f47-3854-b9ed-f60ab9c26c92> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/image_picker_ios.framework/image_picker_ios
       0x103954000 -        0x10396bfff org.cocoapods.just-audio (0.0.1) <5dd6102e-e0fa-3f2c-83f1-17cbb5a58832> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/just_audio.framework/just_audio
       0x103988000 -        0x103993fff org.cocoapods.libphonenumber-plugin (0.0.1) <e6d697ad-d3be-3c5e-b656-16beb680cf6e> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/libphonenumber_plugin.framework/libphonenumber_plugin
       0x103aa4000 -        0x103b4bfff org.cocoapods.libwebp (1.5.0) <245ec6b6-2b95-3412-8ff6-d30e35442cc5> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/libwebp.framework/libwebp
       0x1039ac000 -        0x1039b3fff org.cocoapods.maps-launcher (0.0.1) <2d6796bf-ac5a-3388-93ee-83cd7c23e176> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/maps_launcher.framework/maps_launcher
       0x103168000 -        0x10316ffff org.cocoapods.nanopb (3.30910.0) <00e2affe-f44c-3b22-81e0-f696926288f9> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/nanopb.framework/nanopb
       0x102844000 -        0x102847fff org.cocoapods.package-info-plus (0.4.5) <98815a14-2a9e-3c83-94fb-982e5c20a347> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/package_info_plus.framework/package_info_plus
       0x1039f4000 -        0x1039fffff org.cocoapods.path-provider-foundation (0.0.1) <c01bbc15-950f-3a3a-9089-2fe0c4e9e9d8> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/path_provider_foundation.framework/path_provider_foundation
       0x10314c000 -        0x103153fff org.cocoapods.share-plus (0.0.1) <49cdac4c-5cef-3332-bce6-cc058d7d26ef> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/share_plus.framework/share_plus
       0x103a58000 -        0x103a6bfff org.cocoapods.shared-preferences-foundation (0.0.1) <faedb881-511a-3786-9b1d-a6c9cb04c612> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/shared_preferences_foundation.framework/shared_preferences_foundation
       0x103be4000 -        0x103c03fff org.cocoapods.sqflite-darwin (0.0.4) <c53b19ac-0a06-3492-9fb5-91756da4cba8> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/sqflite_darwin.framework/sqflite_darwin
       0x103a1c000 -        0x103a2ffff org.cocoapods.url-launcher-ios (0.0.1) <753e4318-946e-32dc-a8d7-81a364ad552d> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/url_launcher_ios.framework/url_launcher_ios
       0x103c2c000 -        0x103c3ffff org.cocoapods.video-player-avfoundation (0.0.1) <a158ae9d-baeb-39a4-bd2f-a4209ebbf3d1> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/video_player_avfoundation.framework/video_player_avfoundation
       0x103b98000 -        0x103b9ffff org.cocoapods.wakelock-plus (0.0.1) <31f019a8-709e-3c90-8475-03814e4efd62> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/wakelock_plus.framework/wakelock_plus
       0x105934000 -        0x1059d3fff org.cocoapods.webview-flutter-wkwebview (0.0.1) <9a2cebf5-7287-37d3-a767-202ae88cd3ad> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/webview_flutter_wkwebview.framework/webview_flutter_wkwebview
       0x108afc000 -        0x10acfbfff io.flutter.flutter (1.0) <4c4c44df-5555-3144-a127-936867ca2f59> /Users/USER/Library/Developer/CoreSimulator/Devices/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD/data/Containers/Bundle/Application/160DF5A7-82F1-467D-85A3-5B58C6E81ADC/Runner.app/Frameworks/Flutter.framework/Flutter
       0x1039c8000 -        0x1039cffff libsystem_platform.dylib (*) <3394e9ca-eb51-322d-a5eb-4d895d3b1c14> /usr/lib/system/libsystem_platform.dylib
       0x103c60000 -        0x103c9bfff libsystem_kernel.dylib (*) <0f9f96fe-6b1c-3253-a33a-c9e4a0c2a386> /usr/lib/system/libsystem_kernel.dylib
       0x104128000 -        0x104137fff libsystem_pthread.dylib (*) <3df3256f-466e-37bc-b995-a5a9956e1415> /usr/lib/system/libsystem_pthread.dylib
       0x1023c4000 -        0x1023cffff libobjc-trampolines.dylib (*) <a31fa6bc-f00c-3232-9da8-4e5d7922ed9a> /Volumes/VOLUME/*/libobjc-trampolines.dylib
       0x1800fd000 -        0x180178ff3 libsystem_c.dylib (*) <3e34edd7-d111-3f74-bacd-9a4e955d66e6> /Volumes/VOLUME/*/libsystem_c.dylib
       0x180298000 -        0x1802b3fff libc++abi.dylib (*) <d72e40f3-f7a1-329e-938b-c99e263e665f> /Volumes/VOLUME/*/libc++abi.dylib
       0x180068000 -        0x1800a3d53 libobjc.A.dylib (*) <9ee78930-1d2d-365d-8cdd-fe423f3c769c> /Volumes/VOLUME/*/libobjc.A.dylib
       0x180179000 -        0x1801bdfff libdispatch.dylib (*) <d5e90ee3-9c77-3808-a2ca-3e15e11a9aa1> /Volumes/VOLUME/*/libdispatch.dylib
       0x18038d000 -        0x18075afff com.apple.CoreFoundation (6.9) <e965e773-9803-3e02-8243-5cb8f4365f11> /Volumes/VOLUME/*/CoreFoundation.framework/CoreFoundation
       0x1905e2000 -        0x1905eafff com.apple.GraphicsServices (1.0) <9c82f9b7-b20c-3255-80a1-c4a1e74ef754> /Volumes/VOLUME/*/GraphicsServices.framework/GraphicsServices
       0x184cd3000 -        0x186a10fff com.apple.UIKitCore (1.0) <24ff1688-4bc4-3da8-8f17-c73d22f96263> /Volumes/VOLUME/*/UIKitCore.framework/UIKitCore
               0x0 - 0xffffffffffffffff ??? (*) <00000000-0000-0000-0000-000000000000> ???
       0x1807da000 -        0x181416fff com.apple.Foundation (6.9) <b8e40415-c88f-3ceb-971c-82679743b9be> /Volumes/VOLUME/*/Foundation.framework/Foundation
       0x1b60ce000 -        0x1b62b9fff com.apple.texttospeech (1.0.0) <2a4c6531-93f1-32c7-99f4-5e0b86154e2c> /Volumes/VOLUME/*/TextToSpeech.framework/TextToSpeech
       0x1847fa000 -        0x184b7bfff com.apple.CFNetwork (1.0) <28f30cff-18c1-3fb9-b1e9-e185e004ac74> /Volumes/VOLUME/*/CFNetwork.framework/CFNetwork

EOF

-----------
Full Report
-----------

{"app_name":"Runner","timestamp":"2025-03-30 05:34:14.00 +0200","app_version":"1.0.0","slice_uuid":"a3edbe5a-2cdd-30fb-bc28-1023668379c8","build_version":"1","platform":7,"bundleID":"com.nahr.baytFinder","share_with_app_devs":0,"is_first_party":0,"bug_type":"309","os_version":"macOS 14.6.1 (23G93)","roots_installed":0,"name":"Runner","incident_id":"599D4676-33BD-4DAE-AF68-483DBF6D32B2"}
{
  "uptime" : 380000,
  "procRole" : "Foreground",
  "version" : 2,
  "userID" : 501,
  "deployVersion" : 210,
  "modelCode" : "Macmini9,1",
  "coalitionID" : 29720,
  "osVersion" : {
    "train" : "macOS 14.6.1",
    "build" : "23G93",
    "releaseType" : "User"
  },
  "captureTime" : "2025-03-30 05:34:11.2569 +0200",
  "codeSigningMonitor" : 1,
  "incident" : "599D4676-33BD-4DAE-AF68-483DBF6D32B2",
  "pid" : 29578,
  "translated" : false,
  "cpuType" : "ARM-64",
  "roots_installed" : 0,
  "bug_type" : "309",
  "procLaunch" : "2025-03-30 05:33:48.5086 +0200",
  "procStartAbsTime" : 9352126086397,
  "procExitAbsTime" : 9352666226056,
  "procName" : "Runner",
  "procPath" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Runner",
  "bundleInfo" : {"CFBundleShortVersionString":"1.0.0","CFBundleVersion":"1","CFBundleIdentifier":"com.nahr.baytFinder"},
  "storeInfo" : {"deviceIdentifierForVendor":"B0C405F9-50A0-51A8-960F-A62A0368367F","thirdParty":true},
  "parentProc" : "launchd_sim",
  "parentPid" : 21006,
  "coalitionName" : "com.apple.CoreSimulator.SimDevice.56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD",
  "crashReporterKey" : "A1104BEF-E4D7-EDF6-B418-E95438926C71",
  "responsiblePid" : 656,
  "responsibleProc" : "SimulatorTrampoline",
  "codeSigningID" : "com.nahr.baytFinder",
  "codeSigningTeamID" : "",
  "codeSigningFlags" : 570425857,
  "codeSigningValidationCategory" : 10,
  "codeSigningTrustLevel" : 4294967295,
  "instructionByteStream" : {"beforePC":"4wAAVP17v6n9AwCR9+L\/l78DAJH9e8GowANf1sADX9YQKYDSARAA1A==","atPC":"4wAAVP17v6n9AwCR7eL\/l78DAJH9e8GowANf1sADX9ZwCoDSARAA1A=="},
  "sip" : "enabled",
  "exception" : {"codes":"0x0000000000000000, 0x0000000000000000","rawCodes":[0,0],"type":"EXC_CRASH","signal":"SIGABRT"},
  "termination" : {"flags":0,"code":6,"namespace":"SIGNAL","indicator":"Abort trap: 6","byProc":"Runner","byPid":29578},
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":0,"task_for_pid":2},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "lastExceptionBacktrace" : [{"imageOffset":1229056,"symbol":"__exceptionPreprocess","symbolLocation":160,"imageIndex":65},{"imageOffset":175528,"symbol":"objc_exception_throw","symbolLocation":72,"imageIndex":63},{"imageOffset":1228828,"symbol":"-[NSException initWithCoder:]","symbolLocation":0,"imageIndex":65},{"imageOffset":208032,"symbol":"+[GMSServices checkServicePreconditions]","symbolLocation":260,"imageIndex":3},{"imageOffset":199264,"symbol":"+[GMSServices preLaunchServices]","symbolLocation":112,"imageIndex":3},{"imageOffset":8244112,"symbol":"-[FLTGoogleMapFactory sharedMapServices]","symbolLocation":60,"imageIndex":3},{"imageOffset":8243904,"symbol":"-[FLTGoogleMapFactory createWithFrame:viewIdentifier:arguments:]","symbolLocation":84,"imageIndex":3},{"imageOffset":313892,"symbol":"flutter::PlatformViewsController::OnCreate(FlutterMethodCall*, void (objc_object*) block_pointer)","symbolLocation":796,"imageIndex":56},{"imageOffset":312740,"symbol":"flutter::PlatformViewsController::OnMethodCall(FlutterMethodCall*, void (objc_object*) block_pointer)","symbolLocation":140,"imageIndex":56},{"imageOffset":6434912,"symbol":"__45-[FlutterMethodChannel setMethodCallHandler:]_block_invoke","symbolLocation":164,"imageIndex":56},{"imageOffset":371776,"symbol":"invocation function for block in flutter::PlatformMessageHandlerIos::HandlePlatformMessage(std::_fl::unique_ptr<flutter::PlatformMessage, std::_fl::default_delete<flutter::PlatformMessage>>)","symbolLocation":108,"imageIndex":56},{"imageOffset":8980,"symbol":"_dispatch_call_block_and_release","symbolLocation":24,"imageIndex":64},{"imageOffset":15368,"symbol":"_dispatch_client_callout","symbolLocation":16,"imageIndex":64},{"imageOffset":76844,"symbol":"_dispatch_main_queue_drain","symbolLocation":1276,"imageIndex":64},{"imageOffset":75552,"symbol":"_dispatch_main_queue_callback_4CF","symbolLocation":40,"imageIndex":64},{"imageOffset":589228,"symbol":"__CFRUNLOOP_IS_SERVICING_THE_MAIN_DISPATCH_QUEUE__","symbolLocation":12,"imageIndex":65},{"imageOffset":566024,"symbol":"__CFRunLoopRun","symbolLocation":1944,"imageIndex":65},{"imageOffset":562932,"symbol":"CFRunLoopRunSpecific","symbolLocation":552,"imageIndex":65},{"imageOffset":15120,"symbol":"GSEventRunModal","symbolLocation":160,"imageIndex":66},{"imageOffset":15067612,"symbol":"-[UIApplication _run]","symbolLocation":796,"imageIndex":67},{"imageOffset":15084500,"symbol":"UIApplicationMain","symbolLocation":124,"imageIndex":67},{"imageOffset":2323252,"imageIndex":67},{"imageOffset":26636,"sourceFile":"\/<compiler-generated>","symbol":"static UIApplicationDelegate.main()","symbolLocation":120,"imageIndex":3},{"imageOffset":26500,"sourceFile":"\/<compiler-generated>","symbol":"static AppDelegate.$main()","symbolLocation":44,"imageIndex":3},{"imageOffset":26760,"sourceLine":4,"sourceFile":"AppDelegate.swift","symbol":"__debug_main_executable_dylib_entry_point","imageIndex":3,"symbolLocation":28},{"imageOffset":5136,"symbol":"start_sim","symbolLocation":20,"imageIndex":2},{"imageOffset":24916,"symbol":"start","symbolLocation":2476,"imageIndex":0},{"imageOffset":10750233048021729280,"imageIndex":68}],
  "faultingThread" : 0,
  "threads" : [{"triggered":true,"id":3497797,"threadState":{"x":[{"value":0},{"value":0},{"value":0},{"value":0},{"value":6445272535},{"value":6136729648},{"value":110},{"value":0},{"value":4331782720,"symbolLocation":0,"symbol":"_main_thread"},{"value":7162242564530244490},{"value":81},{"value":11},{"value":11},{"value":6449536462},{"value":2043},{"value":2642538548},{"value":328},{"value":2644633657},{"value":0},{"value":6},{"value":4331782720,"symbolLocation":0,"symbol":"_main_thread"},{"value":259},{"value":4331782944,"symbolLocation":224,"symbol":"_main_thread"},{"value":276},{"value":105553140936448},{"value":105553140936448},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4363317540},"cpsr":{"value":1073745920},"fp":{"value":6136729504},"sp":{"value":6136729472},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4358311728,"matchesCrashFrame":1},"far":{"value":0}},"queue":"com.apple.main-thread","frames":[{"imageOffset":36656,"symbol":"__pthread_kill","symbolLocation":8,"imageIndex":58},{"imageOffset":28964,"symbol":"pthread_kill","symbolLocation":256,"imageIndex":59},{"imageOffset":472300,"symbol":"abort","symbolLocation":104,"imageIndex":61},{"imageOffset":86272,"symbol":"abort_message","symbolLocation":128,"imageIndex":62},{"imageOffset":19204,"symbol":"demangling_terminate_handler()","symbolLocation":300,"imageIndex":62},{"imageOffset":30892,"symbol":"_objc_terminate()","symbolLocation":124,"imageIndex":63},{"imageOffset":83160,"symbol":"std::__terminate(void (*)())","symbolLocation":12,"imageIndex":62},{"imageOffset":83080,"symbol":"std::terminate()","symbolLocation":52,"imageIndex":62},{"imageOffset":15388,"symbol":"_dispatch_client_callout","symbolLocation":36,"imageIndex":64},{"imageOffset":76844,"symbol":"_dispatch_main_queue_drain","symbolLocation":1276,"imageIndex":64},{"imageOffset":75552,"symbol":"_dispatch_main_queue_callback_4CF","symbolLocation":40,"imageIndex":64},{"imageOffset":589228,"symbol":"__CFRUNLOOP_IS_SERVICING_THE_MAIN_DISPATCH_QUEUE__","symbolLocation":12,"imageIndex":65},{"imageOffset":566024,"symbol":"__CFRunLoopRun","symbolLocation":1944,"imageIndex":65},{"imageOffset":562932,"symbol":"CFRunLoopRunSpecific","symbolLocation":552,"imageIndex":65},{"imageOffset":15120,"symbol":"GSEventRunModal","symbolLocation":160,"imageIndex":66},{"imageOffset":15067612,"symbol":"-[UIApplication _run]","symbolLocation":796,"imageIndex":67},{"imageOffset":15084500,"symbol":"UIApplicationMain","symbolLocation":124,"imageIndex":67},{"imageOffset":2323252,"imageIndex":67},{"imageOffset":26636,"sourceFile":"\/<compiler-generated>","symbol":"static UIApplicationDelegate.main()","symbolLocation":120,"imageIndex":3},{"imageOffset":26500,"sourceFile":"\/<compiler-generated>","symbol":"static AppDelegate.$main()","symbolLocation":44,"imageIndex":3},{"imageOffset":26760,"sourceLine":4,"sourceFile":"AppDelegate.swift","symbol":"__debug_main_executable_dylib_entry_point","imageIndex":3,"symbolLocation":28},{"imageOffset":5136,"symbol":"start_sim","symbolLocation":20,"imageIndex":2},{"imageOffset":24916,"symbol":"start","symbolLocation":2476,"imageIndex":0}]},{"id":3497986,"frames":[{"imageOffset":9676,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":59}],"threadState":{"x":[{"value":6138441728},{"value":5635},{"value":6137905152},{"value":0},{"value":409604},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":0},"cpsr":{"value":4096},"fp":{"value":0},"sp":{"value":6138441728},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4363298252},"far":{"value":0}}},{"id":3497988,"name":"com.apple.uikit.eventfetch-thread","threadState":{"x":[{"value":268451845},{"value":21592279046},{"value":8589934592},{"value":48391396524032},{"value":0},{"value":48391396524032},{"value":2},{"value":4294967295},{"value":18446744073709550527},{"value":11267},{"value":0},{"value":1},{"value":11267},{"value":3072},{"value":0},{"value":0},{"value":18446744073709551569},{"value":2},{"value":0},{"value":4294967295},{"value":2},{"value":48391396524032},{"value":0},{"value":48391396524032},{"value":6139010424},{"value":8589934592},{"value":21592279046},{"value":21592279046},{"value":4412409862}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4358350432},"cpsr":{"value":4096},"fp":{"value":6139010272},"sp":{"value":6139010192},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4358279536},"far":{"value":0}},"frames":[{"imageOffset":4464,"symbol":"mach_msg2_trap","symbolLocation":8,"imageIndex":58},{"imageOffset":75360,"symbol":"mach_msg2_internal","symbolLocation":76,"imageIndex":58},{"imageOffset":37656,"symbol":"mach_msg_overwrite","symbolLocation":532,"imageIndex":58},{"imageOffset":5352,"symbol":"mach_msg","symbolLocation":20,"imageIndex":58},{"imageOffset":588496,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":156,"imageIndex":65},{"imageOffset":565240,"symbol":"__CFRunLoopRun","symbolLocation":1160,"imageIndex":65},{"imageOffset":562932,"symbol":"CFRunLoopRunSpecific","symbolLocation":552,"imageIndex":65},{"imageOffset":7623736,"symbol":"-[NSRunLoop(NSRunLoop) runMode:beforeDate:]","symbolLocation":208,"imageIndex":69},{"imageOffset":7624280,"symbol":"-[NSRunLoop(NSRunLoop) runUntilDate:]","symbolLocation":60,"imageIndex":69},{"imageOffset":15778436,"symbol":"-[UIEventFetcher threadMain]","symbolLocation":404,"imageIndex":67},{"imageOffset":7783040,"symbol":"__NSThread__start__","symbolLocation":720,"imageIndex":69},{"imageOffset":29716,"symbol":"_pthread_start","symbolLocation":104,"imageIndex":59},{"imageOffset":9696,"symbol":"thread_start","symbolLocation":8,"imageIndex":59}]},{"id":3497991,"frames":[{"imageOffset":9676,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":59}],"threadState":{"x":[{"value":6140735488},{"value":21507},{"value":6140198912},{"value":0},{"value":409604},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":0},"cpsr":{"value":4096},"fp":{"value":0},"sp":{"value":6140735488},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4363298252},"far":{"value":0}}},{"id":3497996,"name":"io.flutter.1.ui","threadState":{"x":[{"value":268451845},{"value":21592279046},{"value":8589934592},{"value":105566001168384},{"value":0},{"value":105566001168384},{"value":2},{"value":4294967295},{"value":18446744073709550527},{"value":24579},{"value":0},{"value":1},{"value":24579},{"value":3072},{"value":0},{"value":278176441827328},{"value":18446744073709551569},{"value":278176441892098},{"value":0},{"value":4294967295},{"value":2},{"value":105566001168384},{"value":0},{"value":105566001168384},{"value":6144024568},{"value":8589934592},{"value":21592279046},{"value":21592279046},{"value":4412409862}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4358350432},"cpsr":{"value":4096},"fp":{"value":6144024416},"sp":{"value":6144024336},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4358279536},"far":{"value":0}},"frames":[{"imageOffset":4464,"symbol":"mach_msg2_trap","symbolLocation":8,"imageIndex":58},{"imageOffset":75360,"symbol":"mach_msg2_internal","symbolLocation":76,"imageIndex":58},{"imageOffset":37656,"symbol":"mach_msg_overwrite","symbolLocation":532,"imageIndex":58},{"imageOffset":5352,"symbol":"mach_msg","symbolLocation":20,"imageIndex":58},{"imageOffset":588496,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":156,"imageIndex":65},{"imageOffset":565240,"symbol":"__CFRunLoopRun","symbolLocation":1160,"imageIndex":65},{"imageOffset":562932,"symbol":"CFRunLoopRunSpecific","symbolLocation":552,"imageIndex":65},{"imageOffset":538564,"symbol":"fml::MessageLoopDarwin::Run()","symbolLocation":88,"imageIndex":56},{"imageOffset":509652,"symbol":"fml::MessageLoopImpl::DoRun()","symbolLocation":40,"imageIndex":56},{"imageOffset":533616,"symbol":"std::_fl::__function::__func<fml::Thread::Thread(std::_fl::function<void (fml::Thread::ThreadConfig const&)> const&, fml::Thread::ThreadConfig const&)::$_0, std::_fl::allocator<fml::Thread::Thread(std::_fl::function<void (fml::Thread::ThreadConfig const&)> const&, fml::Thread::ThreadConfig const&)::$_0>, void ()>::operator()()","symbolLocation":184,"imageIndex":56},{"imageOffset":532860,"symbol":"fml::ThreadHandle::ThreadHandle(std::_fl::function<void ()>&&)::$_0::__invoke(void*)","symbolLocation":36,"imageIndex":56},{"imageOffset":29716,"symbol":"_pthread_start","symbolLocation":104,"imageIndex":59},{"imageOffset":9696,"symbol":"thread_start","symbolLocation":8,"imageIndex":59}]},{"id":3497997,"name":"io.flutter.1.raster","threadState":{"x":[{"value":268451845},{"value":21592279046},{"value":8589934592},{"value":109964047679488},{"value":0},{"value":109964047679488},{"value":2},{"value":4294967295},{"value":18446744073709550527},{"value":25603},{"value":0},{"value":1},{"value":25603},{"value":3072},{"value":0},{"value":6597069766656},{"value":18446744073709551569},{"value":6597069768194},{"value":0},{"value":4294967295},{"value":2},{"value":109964047679488},{"value":0},{"value":109964047679488},{"value":6146170872},{"value":8589934592},{"value":21592279046},{"value":21592279046},{"value":4412409862}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4358350432},"cpsr":{"value":4096},"fp":{"value":6146170720},"sp":{"value":6146170640},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4358279536},"far":{"value":0}},"frames":[{"imageOffset":4464,"symbol":"mach_msg2_trap","symbolLocation":8,"imageIndex":58},{"imageOffset":75360,"symbol":"mach_msg2_internal","symbolLocation":76,"imageIndex":58},{"imageOffset":37656,"symbol":"mach_msg_overwrite","symbolLocation":532,"imageIndex":58},{"imageOffset":5352,"symbol":"mach_msg","symbolLocation":20,"imageIndex":58},{"imageOffset":588496,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":156,"imageIndex":65},{"imageOffset":565240,"symbol":"__CFRunLoopRun","symbolLocation":1160,"imageIndex":65},{"imageOffset":562932,"symbol":"CFRunLoopRunSpecific","symbolLocation":552,"imageIndex":65},{"imageOffset":538564,"symbol":"fml::MessageLoopDarwin::Run()","symbolLocation":88,"imageIndex":56},{"imageOffset":509652,"symbol":"fml::MessageLoopImpl::DoRun()","symbolLocation":40,"imageIndex":56},{"imageOffset":533616,"symbol":"std::_fl::__function::__func<fml::Thread::Thread(std::_fl::function<void (fml::Thread::ThreadConfig const&)> const&, fml::Thread::ThreadConfig const&)::$_0, std::_fl::allocator<fml::Thread::Thread(std::_fl::function<void (fml::Thread::ThreadConfig const&)> const&, fml::Thread::ThreadConfig const&)::$_0>, void ()>::operator()()","symbolLocation":184,"imageIndex":56},{"imageOffset":532860,"symbol":"fml::ThreadHandle::ThreadHandle(std::_fl::function<void ()>&&)::$_0::__invoke(void*)","symbolLocation":36,"imageIndex":56},{"imageOffset":29716,"symbol":"_pthread_start","symbolLocation":104,"imageIndex":59},{"imageOffset":9696,"symbol":"thread_start","symbolLocation":8,"imageIndex":59}]},{"id":3497998,"name":"io.flutter.1.io","threadState":{"x":[{"value":268451845},{"value":21592279046},{"value":8589934592},{"value":116561117446144},{"value":0},{"value":116561117446144},{"value":2},{"value":4294967295},{"value":18446744073709550527},{"value":27139},{"value":0},{"value":1},{"value":27139},{"value":3072},{"value":0},{"value":0},{"value":18446744073709551569},{"value":2},{"value":0},{"value":4294967295},{"value":2},{"value":116561117446144},{"value":0},{"value":116561117446144},{"value":6148317176},{"value":8589934592},{"value":21592279046},{"value":21592279046},{"value":4412409862}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4358350432},"cpsr":{"value":4096},"fp":{"value":6148317024},"sp":{"value":6148316944},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4358279536},"far":{"value":0}},"frames":[{"imageOffset":4464,"symbol":"mach_msg2_trap","symbolLocation":8,"imageIndex":58},{"imageOffset":75360,"symbol":"mach_msg2_internal","symbolLocation":76,"imageIndex":58},{"imageOffset":37656,"symbol":"mach_msg_overwrite","symbolLocation":532,"imageIndex":58},{"imageOffset":5352,"symbol":"mach_msg","symbolLocation":20,"imageIndex":58},{"imageOffset":588496,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":156,"imageIndex":65},{"imageOffset":565240,"symbol":"__CFRunLoopRun","symbolLocation":1160,"imageIndex":65},{"imageOffset":562932,"symbol":"CFRunLoopRunSpecific","symbolLocation":552,"imageIndex":65},{"imageOffset":538564,"symbol":"fml::MessageLoopDarwin::Run()","symbolLocation":88,"imageIndex":56},{"imageOffset":509652,"symbol":"fml::MessageLoopImpl::DoRun()","symbolLocation":40,"imageIndex":56},{"imageOffset":533616,"symbol":"std::_fl::__function::__func<fml::Thread::Thread(std::_fl::function<void (fml::Thread::ThreadConfig const&)> const&, fml::Thread::ThreadConfig const&)::$_0, std::_fl::allocator<fml::Thread::Thread(std::_fl::function<void (fml::Thread::ThreadConfig const&)> const&, fml::Thread::ThreadConfig const&)::$_0>, void ()>::operator()()","symbolLocation":184,"imageIndex":56},{"imageOffset":532860,"symbol":"fml::ThreadHandle::ThreadHandle(std::_fl::function<void ()>&&)::$_0::__invoke(void*)","symbolLocation":36,"imageIndex":56},{"imageOffset":29716,"symbol":"_pthread_start","symbolLocation":104,"imageIndex":59},{"imageOffset":9696,"symbol":"thread_start","symbolLocation":8,"imageIndex":59}]},{"id":3497999,"name":"io.flutter.1.profiler","threadState":{"x":[{"value":268451845},{"value":21592279046},{"value":8589934592},{"value":184730838368256},{"value":0},{"value":184730838368256},{"value":2},{"value":4294967295},{"value":18446744073709550527},{"value":43011},{"value":0},{"value":1},{"value":43011},{"value":3072},{"value":0},{"value":0},{"value":18446744073709551569},{"value":2},{"value":0},{"value":4294967295},{"value":2},{"value":184730838368256},{"value":0},{"value":184730838368256},{"value":6150463480},{"value":8589934592},{"value":21592279046},{"value":21592279046},{"value":4412409862}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4358350432},"cpsr":{"value":4096},"fp":{"value":6150463328},"sp":{"value":6150463248},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4358279536},"far":{"value":0}},"frames":[{"imageOffset":4464,"symbol":"mach_msg2_trap","symbolLocation":8,"imageIndex":58},{"imageOffset":75360,"symbol":"mach_msg2_internal","symbolLocation":76,"imageIndex":58},{"imageOffset":37656,"symbol":"mach_msg_overwrite","symbolLocation":532,"imageIndex":58},{"imageOffset":5352,"symbol":"mach_msg","symbolLocation":20,"imageIndex":58},{"imageOffset":588496,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":156,"imageIndex":65},{"imageOffset":565240,"symbol":"__CFRunLoopRun","symbolLocation":1160,"imageIndex":65},{"imageOffset":562932,"symbol":"CFRunLoopRunSpecific","symbolLocation":552,"imageIndex":65},{"imageOffset":538564,"symbol":"fml::MessageLoopDarwin::Run()","symbolLocation":88,"imageIndex":56},{"imageOffset":509652,"symbol":"fml::MessageLoopImpl::DoRun()","symbolLocation":40,"imageIndex":56},{"imageOffset":533616,"symbol":"std::_fl::__function::__func<fml::Thread::Thread(std::_fl::function<void (fml::Thread::ThreadConfig const&)> const&, fml::Thread::ThreadConfig const&)::$_0, std::_fl::allocator<fml::Thread::Thread(std::_fl::function<void (fml::Thread::ThreadConfig const&)> const&, fml::Thread::ThreadConfig const&)::$_0>, void ()>::operator()()","symbolLocation":184,"imageIndex":56},{"imageOffset":532860,"symbol":"fml::ThreadHandle::ThreadHandle(std::_fl::function<void ()>&&)::$_0::__invoke(void*)","symbolLocation":36,"imageIndex":56},{"imageOffset":29716,"symbol":"_pthread_start","symbolLocation":104,"imageIndex":59},{"imageOffset":9696,"symbol":"thread_start","symbolLocation":8,"imageIndex":59}]},{"id":3498001,"name":"io.worker.1","threadState":{"x":[{"value":4},{"value":0},{"value":6144},{"value":0},{"value":0},{"value":160},{"value":0},{"value":0},{"value":6151040504},{"value":0},{"value":4390441488},{"value":2},{"value":0},{"value":0},{"value":0},{"value":0},{"value":305},{"value":114},{"value":0},{"value":4390441464},{"value":4390441528},{"value":6151041248},{"value":0},{"value":0},{"value":6144},{"value":6144},{"value":7168},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4363319756},"cpsr":{"value":1610616832},"fp":{"value":6151040624},"sp":{"value":6151040480},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4358293104},"far":{"value":0}},"frames":[{"imageOffset":18032,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":58},{"imageOffset":31180,"symbol":"_pthread_cond_wait","symbolLocation":1216,"imageIndex":59},{"imageOffset":377676,"symbol":"std::_fl::condition_variable::wait(std::_fl::unique_lock<std::_fl::mutex>&)","symbolLocation":24,"imageIndex":56},{"imageOffset":494340,"symbol":"fml::ConcurrentMessageLoop::WorkerMain()","symbolLocation":128,"imageIndex":56},{"imageOffset":496604,"symbol":"void* std::_fl::__thread_proxy[abi:v15000]<std::_fl::tuple<std::_fl::unique_ptr<std::_fl::__thread_struct, std::_fl::default_delete<std::_fl::__thread_struct>>, fml::ConcurrentMessageLoop::ConcurrentMessageLoop(unsigned long)::$_0>>(void*)","symbolLocation":184,"imageIndex":56},{"imageOffset":29716,"symbol":"_pthread_start","symbolLocation":104,"imageIndex":59},{"imageOffset":9696,"symbol":"thread_start","symbolLocation":8,"imageIndex":59}]},{"id":3498002,"name":"io.worker.2","threadState":{"x":[{"value":4},{"value":0},{"value":6656},{"value":0},{"value":0},{"value":160},{"value":0},{"value":0},{"value":6151613944},{"value":0},{"value":4390441488},{"value":2},{"value":0},{"value":0},{"value":0},{"value":0},{"value":305},{"value":39},{"value":0},{"value":4390441464},{"value":4390441528},{"value":6151614688},{"value":0},{"value":0},{"value":6656},{"value":6656},{"value":7680},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4363319756},"cpsr":{"value":1610616832},"fp":{"value":6151614064},"sp":{"value":6151613920},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4358293104},"far":{"value":0}},"frames":[{"imageOffset":18032,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":58},{"imageOffset":31180,"symbol":"_pthread_cond_wait","symbolLocation":1216,"imageIndex":59},{"imageOffset":377676,"symbol":"std::_fl::condition_variable::wait(std::_fl::unique_lock<std::_fl::mutex>&)","symbolLocation":24,"imageIndex":56},{"imageOffset":494340,"symbol":"fml::ConcurrentMessageLoop::WorkerMain()","symbolLocation":128,"imageIndex":56},{"imageOffset":496604,"symbol":"void* std::_fl::__thread_proxy[abi:v15000]<std::_fl::tuple<std::_fl::unique_ptr<std::_fl::__thread_struct, std::_fl::default_delete<std::_fl::__thread_struct>>, fml::ConcurrentMessageLoop::ConcurrentMessageLoop(unsigned long)::$_0>>(void*)","symbolLocation":184,"imageIndex":56},{"imageOffset":29716,"symbol":"_pthread_start","symbolLocation":104,"imageIndex":59},{"imageOffset":9696,"symbol":"thread_start","symbolLocation":8,"imageIndex":59}]},{"id":3498003,"name":"io.worker.3","threadState":{"x":[{"value":4},{"value":0},{"value":6912},{"value":0},{"value":0},{"value":160},{"value":0},{"value":0},{"value":6152187384},{"value":0},{"value":4390441488},{"value":2},{"value":0},{"value":0},{"value":0},{"value":0},{"value":305},{"value":68},{"value":0},{"value":4390441464},{"value":4390441528},{"value":6152188128},{"value":0},{"value":0},{"value":6912},{"value":6912},{"value":7936},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4363319756},"cpsr":{"value":1610616832},"fp":{"value":6152187504},"sp":{"value":6152187360},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4358293104},"far":{"value":0}},"frames":[{"imageOffset":18032,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":58},{"imageOffset":31180,"symbol":"_pthread_cond_wait","symbolLocation":1216,"imageIndex":59},{"imageOffset":377676,"symbol":"std::_fl::condition_variable::wait(std::_fl::unique_lock<std::_fl::mutex>&)","symbolLocation":24,"imageIndex":56},{"imageOffset":494340,"symbol":"fml::ConcurrentMessageLoop::WorkerMain()","symbolLocation":128,"imageIndex":56},{"imageOffset":496604,"symbol":"void* std::_fl::__thread_proxy[abi:v15000]<std::_fl::tuple<std::_fl::unique_ptr<std::_fl::__thread_struct, std::_fl::default_delete<std::_fl::__thread_struct>>, fml::ConcurrentMessageLoop::ConcurrentMessageLoop(unsigned long)::$_0>>(void*)","symbolLocation":184,"imageIndex":56},{"imageOffset":29716,"symbol":"_pthread_start","symbolLocation":104,"imageIndex":59},{"imageOffset":9696,"symbol":"thread_start","symbolLocation":8,"imageIndex":59}]},{"id":3498004,"name":"io.worker.4","threadState":{"x":[{"value":260},{"value":0},{"value":6400},{"value":0},{"value":0},{"value":160},{"value":0},{"value":0},{"value":6152760824},{"value":0},{"value":4390441488},{"value":2},{"value":0},{"value":0},{"value":0},{"value":0},{"value":305},{"value":41},{"value":0},{"value":4390441464},{"value":4390441528},{"value":6152761568},{"value":0},{"value":0},{"value":6400},{"value":6400},{"value":7424},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4363319756},"cpsr":{"value":1610616832},"fp":{"value":6152760944},"sp":{"value":6152760800},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4358293104},"far":{"value":0}},"frames":[{"imageOffset":18032,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":58},{"imageOffset":31180,"symbol":"_pthread_cond_wait","symbolLocation":1216,"imageIndex":59},{"imageOffset":377676,"symbol":"std::_fl::condition_variable::wait(std::_fl::unique_lock<std::_fl::mutex>&)","symbolLocation":24,"imageIndex":56},{"imageOffset":494340,"symbol":"fml::ConcurrentMessageLoop::WorkerMain()","symbolLocation":128,"imageIndex":56},{"imageOffset":496604,"symbol":"void* std::_fl::__thread_proxy[abi:v15000]<std::_fl::tuple<std::_fl::unique_ptr<std::_fl::__thread_struct, std::_fl::default_delete<std::_fl::__thread_struct>>, fml::ConcurrentMessageLoop::ConcurrentMessageLoop(unsigned long)::$_0>>(void*)","symbolLocation":184,"imageIndex":56},{"imageOffset":29716,"symbol":"_pthread_start","symbolLocation":104,"imageIndex":59},{"imageOffset":9696,"symbol":"thread_start","symbolLocation":8,"imageIndex":59}]},{"id":3498005,"name":"dart:io EventHandler","threadState":{"x":[{"value":4},{"value":0},{"value":0},{"value":6153858328},{"value":16},{"value":6153857288},{"value":0},{"value":0},{"value":665000000},{"value":2},{"value":6443492832,"symbolLocation":284,"symbol":"clock_gettime_nsec_np"},{"value":0},{"value":0},{"value":256},{"value":256},{"value":0},{"value":363},{"value":822434697768192},{"value":0},{"value":105553156135104},{"value":6153857288},{"value":67108864},{"value":2147483647},{"value":274877907},{"value":4294966296},{"value":1000000},{"value":389697086},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4446798760},"cpsr":{"value":536875008},"fp":{"value":6153858928},"sp":{"value":6153857264},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4358302956},"far":{"value":0}},"frames":[{"imageOffset":27884,"symbol":"kevent","symbolLocation":8,"imageIndex":58},{"imageOffset":6095784,"symbol":"dart::bin::EventHandlerImplementation::EventHandlerEntry(unsigned long)","symbolLocation":300,"imageIndex":56},{"imageOffset":6211100,"symbol":"dart::bin::ThreadStart(void*)","symbolLocation":88,"imageIndex":56},{"imageOffset":29716,"symbol":"_pthread_start","symbolLocation":104,"imageIndex":59},{"imageOffset":9696,"symbol":"thread_start","symbolLocation":8,"imageIndex":59}]},{"id":3498006,"name":"Dart Profiler ThreadInterrupter","threadState":{"x":[{"value":260},{"value":0},{"value":1227264},{"value":0},{"value":0},{"value":160},{"value":0},{"value":1000000},{"value":1238529},{"value":0},{"value":105553162419480},{"value":13194139536386},{"value":3072},{"value":0},{"value":3072},{"value":13194139536384},{"value":305},{"value":5318337744791040},{"value":0},{"value":105553162419456},{"value":105553162419528},{"value":1},{"value":1000000},{"value":0},{"value":1227264},{"value":1238529},{"value":1238784},{"value":4477177856,"symbolLocation":5864,"symbol":"dart::Symbols::symbol_handles_"},{"value":2}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4363319800},"cpsr":{"value":2684358656},"fp":{"value":6154955408},"sp":{"value":6154955264},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4358293104},"far":{"value":0}},"frames":[{"imageOffset":18032,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":58},{"imageOffset":31224,"symbol":"_pthread_cond_wait","symbolLocation":1260,"imageIndex":59},{"imageOffset":6593476,"symbol":"dart::ConditionVariable::WaitMicros(dart::Mutex*, long long)","symbolLocation":112,"imageIndex":56},{"imageOffset":8170744,"symbol":"dart::ThreadInterrupter::ThreadMain(unsigned long)","symbolLocation":328,"imageIndex":56},{"imageOffset":7720252,"symbol":"dart::ThreadStart(void*)","symbolLocation":204,"imageIndex":56},{"imageOffset":29716,"symbol":"_pthread_start","symbolLocation":104,"imageIndex":59},{"imageOffset":9696,"symbol":"thread_start","symbolLocation":8,"imageIndex":59}]},{"id":3498007,"name":"Dart Profiler SampleBlockProcessor","threadState":{"x":[{"value":260},{"value":0},{"value":256},{"value":0},{"value":0},{"value":160},{"value":0},{"value":100000000},{"value":52481},{"value":0},{"value":105553162432024},{"value":1099511628034},{"value":256},{"value":0},{"value":256},{"value":1099511628032},{"value":305},{"value":105553150984352},{"value":0},{"value":105553162432000},{"value":105553162432072},{"value":1},{"value":100000000},{"value":0},{"value":256},{"value":52481},{"value":52736},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4363319800},"cpsr":{"value":2684358656},"fp":{"value":6156053136},"sp":{"value":6156052992},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4358293104},"far":{"value":0}},"frames":[{"imageOffset":18032,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":58},{"imageOffset":31224,"symbol":"_pthread_cond_wait","symbolLocation":1260,"imageIndex":59},{"imageOffset":6593476,"symbol":"dart::ConditionVariable::WaitMicros(dart::Mutex*, long long)","symbolLocation":112,"imageIndex":56},{"imageOffset":7739356,"symbol":"dart::SampleBlockProcessor::ThreadMain(unsigned long)","symbolLocation":292,"imageIndex":56},{"imageOffset":7720252,"symbol":"dart::ThreadStart(void*)","symbolLocation":204,"imageIndex":56},{"imageOffset":29716,"symbol":"_pthread_start","symbolLocation":104,"imageIndex":59},{"imageOffset":9696,"symbol":"thread_start","symbolLocation":8,"imageIndex":59}]},{"id":3498008,"name":"DartWorker","threadState":{"x":[{"value":105553178363200},{"value":4966785864},{"value":4966785896},{"value":4697556384},{"value":4449048832,"symbolLocation":0,"symbol":"dart::MarkingVisitorBase<true>::VisitPointers(dart::ObjectPtr*, dart::ObjectPtr*)"},{"value":33},{"value":0},{"value":0},{"value":105553178363200},{"value":4449048832,"symbolLocation":0,"symbol":"dart::MarkingVisitorBase<true>::VisitPointers(dart::ObjectPtr*, dart::ObjectPtr*)"},{"value":4455670636,"symbolLocation":220,"symbol":"dart::OSThread::kInvalidThreadJoinId"},{"value":4448476740,"symbolLocation":520,"symbol":"dart::UntaggedObject::VisitPointersPredefined(dart::ObjectPointerVisitor*, long)"},{"value":116},{"value":529964604711424},{"value":2147483647},{"value":4393549952},{"value":4363297612,"symbolLocation":0,"symbol":"pthread_mutex_unlock"},{"value":528865093083650},{"value":0},{"value":4963762641},{"value":0},{"value":4},{"value":3743902337425859446},{"value":64},{"value":4964654376},{"value":4964654392},{"value":36},{"value":4476990160,"symbolLocation":0,"symbol":"dart::Object::null_"},{"value":32}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4448477416},"cpsr":{"value":2147487744},"fp":{"value":6157151584},"sp":{"value":6157151520},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4449049056},"far":{"value":0}},"frames":[{"imageOffset":8346080,"symbol":"dart::MarkingVisitorBase<true>::VisitPointers(dart::ObjectPtr*, dart::ObjectPtr*)","symbolLocation":224,"imageIndex":56},{"imageOffset":7774440,"symbol":"dart::UntaggedObject::VisitPointersPredefined(dart::ObjectPointerVisitor*, long)","symbolLocation":1196,"imageIndex":56},{"imageOffset":8347308,"symbol":"dart::MarkingVisitorBase<true>::DrainMarkingStackWithPauseChecks()","symbolLocation":464,"imageIndex":56},{"imageOffset":8346636,"symbol":"dart::ConcurrentMarkTask::Run()","symbolLocation":116,"imageIndex":56},{"imageOffset":8173924,"symbol":"dart::ThreadPool::WorkerLoop(dart::ThreadPool::Worker*)","symbolLocation":268,"imageIndex":56},{"imageOffset":8174508,"symbol":"dart::ThreadPool::Worker::Main(unsigned long)","symbolLocation":116,"imageIndex":56},{"imageOffset":7720252,"symbol":"dart::ThreadStart(void*)","symbolLocation":204,"imageIndex":56},{"imageOffset":29716,"symbol":"_pthread_start","symbolLocation":104,"imageIndex":59},{"imageOffset":9696,"symbol":"thread_start","symbolLocation":8,"imageIndex":59}]},{"id":3498060,"name":"DartWorker","threadState":{"x":[{"value":105553178363424},{"value":4966944976},{"value":4966944976},{"value":33},{"value":4449048832,"symbolLocation":0,"symbol":"dart::MarkingVisitorBase<true>::VisitPointers(dart::ObjectPtr*, dart::ObjectPtr*)"},{"value":33},{"value":0},{"value":253515000},{"value":4449048832,"symbolLocation":0,"symbol":"dart::MarkingVisitorBase<true>::VisitPointers(dart::ObjectPtr*, dart::ObjectPtr*)"},{"value":0},{"value":31},{"value":4448477460,"symbolLocation":1240,"symbol":"dart::UntaggedObject::VisitPointersPredefined(dart::ObjectPointerVisitor*, long)"},{"value":296},{"value":529964604711424},{"value":2147483647},{"value":4392501376},{"value":4363297612,"symbolLocation":0,"symbol":"pthread_mutex_unlock"},{"value":105553150877184},{"value":0},{"value":4970722577},{"value":0},{"value":4},{"value":369972},{"value":74},{"value":4875392408},{"value":4875392408},{"value":23},{"value":4476990160,"symbolLocation":0,"symbol":"dart::Object::null_"},{"value":32}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4448478496},"cpsr":{"value":1610616832},"fp":{"value":6158249328},"sp":{"value":6158249264},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4449049056},"far":{"value":0}},"frames":[{"imageOffset":8346080,"symbol":"dart::MarkingVisitorBase<true>::VisitPointers(dart::ObjectPtr*, dart::ObjectPtr*)","symbolLocation":224,"imageIndex":56},{"imageOffset":7775520,"symbol":"dart::UntaggedObjectPool::VisitObjectPoolPointers(dart::ObjectPoolPtr, dart::ObjectPointerVisitor*)","symbolLocation":104,"imageIndex":56},{"imageOffset":8347308,"symbol":"dart::MarkingVisitorBase<true>::DrainMarkingStackWithPauseChecks()","symbolLocation":464,"imageIndex":56},{"imageOffset":8346636,"symbol":"dart::ConcurrentMarkTask::Run()","symbolLocation":116,"imageIndex":56},{"imageOffset":8173924,"symbol":"dart::ThreadPool::WorkerLoop(dart::ThreadPool::Worker*)","symbolLocation":268,"imageIndex":56},{"imageOffset":8174508,"symbol":"dart::ThreadPool::Worker::Main(unsigned long)","symbolLocation":116,"imageIndex":56},{"imageOffset":7720252,"symbol":"dart::ThreadStart(void*)","symbolLocation":204,"imageIndex":56},{"imageOffset":29716,"symbol":"_pthread_start","symbolLocation":104,"imageIndex":59},{"imageOffset":9696,"symbol":"thread_start","symbolLocation":8,"imageIndex":59}]},{"id":3498061,"name":"DartWorker","threadState":{"x":[{"value":260},{"value":0},{"value":44800},{"value":0},{"value":0},{"value":160},{"value":5},{"value":0},{"value":44801},{"value":0},{"value":4390443552},{"value":9895604652290},{"value":2304},{"value":0},{"value":2304},{"value":9895604652288},{"value":305},{"value":416},{"value":0},{"value":4390443528},{"value":105553156168976},{"value":1},{"value":0},{"value":5},{"value":44800},{"value":44801},{"value":45056},{"value":4477177856,"symbolLocation":5864,"symbol":"dart::Symbols::symbol_handles_"},{"value":1000}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4363319800},"cpsr":{"value":2684358656},"fp":{"value":6159346240},"sp":{"value":6159346096},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4358293104},"far":{"value":0}},"frames":[{"imageOffset":18032,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":58},{"imageOffset":31224,"symbol":"_pthread_cond_wait","symbolLocation":1260,"imageIndex":59},{"imageOffset":6593476,"symbol":"dart::ConditionVariable::WaitMicros(dart::Mutex*, long long)","symbolLocation":112,"imageIndex":56},{"imageOffset":8174164,"symbol":"dart::ThreadPool::WorkerLoop(dart::ThreadPool::Worker*)","symbolLocation":508,"imageIndex":56},{"imageOffset":8174508,"symbol":"dart::ThreadPool::Worker::Main(unsigned long)","symbolLocation":116,"imageIndex":56},{"imageOffset":7720252,"symbol":"dart::ThreadStart(void*)","symbolLocation":204,"imageIndex":56},{"imageOffset":29716,"symbol":"_pthread_start","symbolLocation":104,"imageIndex":59},{"imageOffset":9696,"symbol":"thread_start","symbolLocation":8,"imageIndex":59}]},{"id":3498068,"name":"AXSpeech","threadState":{"x":[{"value":268451845},{"value":21592279046},{"value":8589934592},{"value":153944512790528},{"value":0},{"value":153944512790528},{"value":2},{"value":4294967295},{"value":18446744073709550527},{"value":35843},{"value":0},{"value":1},{"value":35843},{"value":3072},{"value":0},{"value":0},{"value":18446744073709551569},{"value":2},{"value":0},{"value":4294967295},{"value":2},{"value":153944512790528},{"value":0},{"value":153944512790528},{"value":6159916456},{"value":8589934592},{"value":21592279046},{"value":21592279046},{"value":4412409862}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4358350432},"cpsr":{"value":4096},"fp":{"value":6159916304},"sp":{"value":6159916224},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4358279536},"far":{"value":0}},"frames":[{"imageOffset":4464,"symbol":"mach_msg2_trap","symbolLocation":8,"imageIndex":58},{"imageOffset":75360,"symbol":"mach_msg2_internal","symbolLocation":76,"imageIndex":58},{"imageOffset":37656,"symbol":"mach_msg_overwrite","symbolLocation":532,"imageIndex":58},{"imageOffset":5352,"symbol":"mach_msg","symbolLocation":20,"imageIndex":58},{"imageOffset":588496,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":156,"imageIndex":65},{"imageOffset":565240,"symbol":"__CFRunLoopRun","symbolLocation":1160,"imageIndex":65},{"imageOffset":562932,"symbol":"CFRunLoopRunSpecific","symbolLocation":552,"imageIndex":65},{"imageOffset":7623736,"symbol":"-[NSRunLoop(NSRunLoop) runMode:beforeDate:]","symbolLocation":208,"imageIndex":69},{"imageOffset":174300,"imageIndex":70},{"imageOffset":7783040,"symbol":"__NSThread__start__","symbolLocation":720,"imageIndex":69},{"imageOffset":29716,"symbol":"_pthread_start","symbolLocation":104,"imageIndex":59},{"imageOffset":9696,"symbol":"thread_start","symbolLocation":8,"imageIndex":59}]},{"id":3498075,"name":"DartWorker","threadState":{"x":[{"value":260},{"value":0},{"value":191744},{"value":0},{"value":0},{"value":160},{"value":61},{"value":0},{"value":191745},{"value":0},{"value":4391494896},{"value":19791209304578},{"value":4608},{"value":0},{"value":4608},{"value":19791209304576},{"value":305},{"value":387},{"value":0},{"value":4391494872},{"value":105553156171184},{"value":1},{"value":0},{"value":61},{"value":191744},{"value":191745},{"value":192000},{"value":4477177856,"symbolLocation":5864,"symbol":"dart::Symbols::symbol_handles_"},{"value":1000}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4363319800},"cpsr":{"value":2684358656},"fp":{"value":6162115056},"sp":{"value":6162114912},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4358293104},"far":{"value":0}},"frames":[{"imageOffset":18032,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":58},{"imageOffset":31224,"symbol":"_pthread_cond_wait","symbolLocation":1260,"imageIndex":59},{"imageOffset":6593476,"symbol":"dart::ConditionVariable::WaitMicros(dart::Mutex*, long long)","symbolLocation":112,"imageIndex":56},{"imageOffset":6976528,"symbol":"dart::MutatorThreadPool::OnEnterIdleLocked(dart::MutexLocker*, dart::ThreadPool::Worker*)","symbolLocation":152,"imageIndex":56},{"imageOffset":8173780,"symbol":"dart::ThreadPool::WorkerLoop(dart::ThreadPool::Worker*)","symbolLocation":124,"imageIndex":56},{"imageOffset":8174508,"symbol":"dart::ThreadPool::Worker::Main(unsigned long)","symbolLocation":116,"imageIndex":56},{"imageOffset":7720252,"symbol":"dart::ThreadStart(void*)","symbolLocation":204,"imageIndex":56},{"imageOffset":29716,"symbol":"_pthread_start","symbolLocation":104,"imageIndex":59},{"imageOffset":9696,"symbol":"thread_start","symbolLocation":8,"imageIndex":59}]},{"id":3498079,"frames":[{"imageOffset":9676,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":59}],"threadState":{"x":[{"value":6162690048},{"value":36867},{"value":6162153472},{"value":0},{"value":409604},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":0},"cpsr":{"value":4096},"fp":{"value":0},"sp":{"value":6162690048},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4363298252},"far":{"value":0}}},{"id":3498084,"frames":[{"imageOffset":9676,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":59}],"threadState":{"x":[{"value":6164410368},{"value":45079},{"value":6163873792},{"value":0},{"value":409604},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":0},"cpsr":{"value":4096},"fp":{"value":0},"sp":{"value":6164410368},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4363298252},"far":{"value":0}}},{"id":3498368,"name":"com.apple.NSURLConnectionLoader","threadState":{"x":[{"value":268451845},{"value":21592279046},{"value":8589934592},{"value":258501196644352},{"value":0},{"value":258501196644352},{"value":2},{"value":4294967295},{"value":18446744073709550527},{"value":60187},{"value":0},{"value":1},{"value":60187},{"value":3072},{"value":0},{"value":2199023255552},{"value":18446744073709551569},{"value":2199023256066},{"value":0},{"value":4294967295},{"value":2},{"value":258501196644352},{"value":0},{"value":258501196644352},{"value":6164979000},{"value":8589934592},{"value":21592279046},{"value":21592279046},{"value":4412409862}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4358350432},"cpsr":{"value":4096},"fp":{"value":6164978848},"sp":{"value":6164978768},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4358279536},"far":{"value":0}},"frames":[{"imageOffset":4464,"symbol":"mach_msg2_trap","symbolLocation":8,"imageIndex":58},{"imageOffset":75360,"symbol":"mach_msg2_internal","symbolLocation":76,"imageIndex":58},{"imageOffset":37656,"symbol":"mach_msg_overwrite","symbolLocation":532,"imageIndex":58},{"imageOffset":5352,"symbol":"mach_msg","symbolLocation":20,"imageIndex":58},{"imageOffset":588496,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":156,"imageIndex":65},{"imageOffset":565240,"symbol":"__CFRunLoopRun","symbolLocation":1160,"imageIndex":65},{"imageOffset":562932,"symbol":"CFRunLoopRunSpecific","symbolLocation":552,"imageIndex":65},{"imageOffset":2137444,"symbol":"+[__CFN_CoreSchedulingSetRunnable _run:]","symbolLocation":372,"imageIndex":71},{"imageOffset":7783040,"symbol":"__NSThread__start__","symbolLocation":720,"imageIndex":69},{"imageOffset":29716,"symbol":"_pthread_start","symbolLocation":104,"imageIndex":59},{"imageOffset":9696,"symbol":"thread_start","symbolLocation":8,"imageIndex":59}]},{"id":3498775,"name":"DartWorker","threadState":{"x":[{"value":260},{"value":0},{"value":19456},{"value":0},{"value":0},{"value":160},{"value":5},{"value":0},{"value":19457},{"value":0},{"value":4393814704},{"value":3298534884098},{"value":768},{"value":0},{"value":768},{"value":3298534884096},{"value":305},{"value":151},{"value":0},{"value":4393814680},{"value":105553156320752},{"value":1},{"value":0},{"value":5},{"value":19456},{"value":19457},{"value":19712},{"value":4477177856,"symbolLocation":5864,"symbol":"dart::Symbols::symbol_handles_"},{"value":1000}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4363319800},"cpsr":{"value":2684358656},"fp":{"value":6166080064},"sp":{"value":6166079920},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4358293104},"far":{"value":0}},"frames":[{"imageOffset":18032,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":58},{"imageOffset":31224,"symbol":"_pthread_cond_wait","symbolLocation":1260,"imageIndex":59},{"imageOffset":6593476,"symbol":"dart::ConditionVariable::WaitMicros(dart::Mutex*, long long)","symbolLocation":112,"imageIndex":56},{"imageOffset":8174164,"symbol":"dart::ThreadPool::WorkerLoop(dart::ThreadPool::Worker*)","symbolLocation":508,"imageIndex":56},{"imageOffset":8174508,"symbol":"dart::ThreadPool::Worker::Main(unsigned long)","symbolLocation":116,"imageIndex":56},{"imageOffset":7720252,"symbol":"dart::ThreadStart(void*)","symbolLocation":204,"imageIndex":56},{"imageOffset":29716,"symbol":"_pthread_start","symbolLocation":104,"imageIndex":59},{"imageOffset":9696,"symbol":"thread_start","symbolLocation":8,"imageIndex":59}]},{"id":3498894,"name":"DartWorker","threadState":{"x":[{"value":260},{"value":0},{"value":84224},{"value":0},{"value":0},{"value":160},{"value":5},{"value":0},{"value":84225},{"value":0},{"value":4393814704},{"value":3298534884098},{"value":768},{"value":0},{"value":768},{"value":3298534884096},{"value":305},{"value":178},{"value":0},{"value":4393814680},{"value":105553156374320},{"value":1},{"value":0},{"value":5},{"value":84224},{"value":84225},{"value":84480},{"value":4477177856,"symbolLocation":5864,"symbol":"dart::Symbols::symbol_handles_"},{"value":1000}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4363319800},"cpsr":{"value":2684358656},"fp":{"value":6172666432},"sp":{"value":6172666288},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4358293104},"far":{"value":0}},"frames":[{"imageOffset":18032,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":58},{"imageOffset":31224,"symbol":"_pthread_cond_wait","symbolLocation":1260,"imageIndex":59},{"imageOffset":6593476,"symbol":"dart::ConditionVariable::WaitMicros(dart::Mutex*, long long)","symbolLocation":112,"imageIndex":56},{"imageOffset":8174164,"symbol":"dart::ThreadPool::WorkerLoop(dart::ThreadPool::Worker*)","symbolLocation":508,"imageIndex":56},{"imageOffset":8174508,"symbol":"dart::ThreadPool::Worker::Main(unsigned long)","symbolLocation":116,"imageIndex":56},{"imageOffset":7720252,"symbol":"dart::ThreadStart(void*)","symbolLocation":204,"imageIndex":56},{"imageOffset":29716,"symbol":"_pthread_start","symbolLocation":104,"imageIndex":59},{"imageOffset":9696,"symbol":"thread_start","symbolLocation":8,"imageIndex":59}]},{"id":3498898,"name":"DartWorker","threadState":{"x":[{"value":260},{"value":0},{"value":35072},{"value":0},{"value":0},{"value":160},{"value":5},{"value":0},{"value":35073},{"value":0},{"value":4393814704},{"value":3298534884098},{"value":768},{"value":0},{"value":768},{"value":3298534884096},{"value":305},{"value":114},{"value":0},{"value":4393814680},{"value":105553156371632},{"value":1},{"value":0},{"value":5},{"value":35072},{"value":35073},{"value":35328},{"value":4477177856,"symbolLocation":5864,"symbol":"dart::Symbols::symbol_handles_"},{"value":1000}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4363319800},"cpsr":{"value":2684358656},"fp":{"value":6177057344},"sp":{"value":6177057200},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4358293104},"far":{"value":0}},"frames":[{"imageOffset":18032,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":58},{"imageOffset":31224,"symbol":"_pthread_cond_wait","symbolLocation":1260,"imageIndex":59},{"imageOffset":6593476,"symbol":"dart::ConditionVariable::WaitMicros(dart::Mutex*, long long)","symbolLocation":112,"imageIndex":56},{"imageOffset":8174164,"symbol":"dart::ThreadPool::WorkerLoop(dart::ThreadPool::Worker*)","symbolLocation":508,"imageIndex":56},{"imageOffset":8174508,"symbol":"dart::ThreadPool::Worker::Main(unsigned long)","symbolLocation":116,"imageIndex":56},{"imageOffset":7720252,"symbol":"dart::ThreadStart(void*)","symbolLocation":204,"imageIndex":56},{"imageOffset":29716,"symbol":"_pthread_start","symbolLocation":104,"imageIndex":59},{"imageOffset":9696,"symbol":"thread_start","symbolLocation":8,"imageIndex":59}]},{"id":3498988,"name":"DartWorker","threadState":{"x":[{"value":260},{"value":0},{"value":0},{"value":0},{"value":0},{"value":160},{"value":5},{"value":0},{"value":1},{"value":0},{"value":4390887728},{"value":2},{"value":0},{"value":0},{"value":0},{"value":0},{"value":305},{"value":20},{"value":0},{"value":4390887704},{"value":105553156389648},{"value":1},{"value":0},{"value":5},{"value":0},{"value":1},{"value":256},{"value":4477177856,"symbolLocation":5864,"symbol":"dart::Symbols::symbol_handles_"},{"value":1000}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4363319800},"cpsr":{"value":2684358656},"fp":{"value":6171568704},"sp":{"value":6171568560},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4358293104},"far":{"value":0}},"frames":[{"imageOffset":18032,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":58},{"imageOffset":31224,"symbol":"_pthread_cond_wait","symbolLocation":1260,"imageIndex":59},{"imageOffset":6593476,"symbol":"dart::ConditionVariable::WaitMicros(dart::Mutex*, long long)","symbolLocation":112,"imageIndex":56},{"imageOffset":8174164,"symbol":"dart::ThreadPool::WorkerLoop(dart::ThreadPool::Worker*)","symbolLocation":508,"imageIndex":56},{"imageOffset":8174508,"symbol":"dart::ThreadPool::Worker::Main(unsigned long)","symbolLocation":116,"imageIndex":56},{"imageOffset":7720252,"symbol":"dart::ThreadStart(void*)","symbolLocation":204,"imageIndex":56},{"imageOffset":29716,"symbol":"_pthread_start","symbolLocation":104,"imageIndex":59},{"imageOffset":9696,"symbol":"thread_start","symbolLocation":8,"imageIndex":59}]},{"id":3499019,"name":"DartWorker","threadState":{"x":[{"value":260},{"value":0},{"value":0},{"value":0},{"value":0},{"value":160},{"value":4},{"value":999999000},{"value":1},{"value":0},{"value":4390467856},{"value":2},{"value":0},{"value":0},{"value":0},{"value":0},{"value":305},{"value":250},{"value":0},{"value":4390467832},{"value":105553156197904},{"value":1},{"value":999999000},{"value":4},{"value":0},{"value":1},{"value":256},{"value":4477177856,"symbolLocation":5864,"symbol":"dart::Symbols::symbol_handles_"},{"value":1000}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4363319800},"cpsr":{"value":2684358656},"fp":{"value":6170470976},"sp":{"value":6170470832},"esr":{"value":1442840704,"description":" Address size fault"},"pc":{"value":4358293104},"far":{"value":0}},"frames":[{"imageOffset":18032,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":58},{"imageOffset":31224,"symbol":"_pthread_cond_wait","symbolLocation":1260,"imageIndex":59},{"imageOffset":6593476,"symbol":"dart::ConditionVariable::WaitMicros(dart::Mutex*, long long)","symbolLocation":112,"imageIndex":56},{"imageOffset":8174164,"symbol":"dart::ThreadPool::WorkerLoop(dart::ThreadPool::Worker*)","symbolLocation":508,"imageIndex":56},{"imageOffset":8174508,"symbol":"dart::ThreadPool::Worker::Main(unsigned long)","symbolLocation":116,"imageIndex":56},{"imageOffset":7720252,"symbol":"dart::ThreadStart(void*)","symbolLocation":204,"imageIndex":56},{"imageOffset":29716,"symbol":"_pthread_start","symbolLocation":104,"imageIndex":59},{"imageOffset":9696,"symbol":"thread_start","symbolLocation":8,"imageIndex":59}]},{"id":3499083,"frames":[{"imageOffset":9676,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":59}],"threadState":{"x":[{"value":6137294848},{"value":0},{"value":6136758272},{"value":0},{"value":278532},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":0},"cpsr":{"value":4096},"fp":{"value":0},"sp":{"value":6137294848},"esr":{"value":0,"description":" Address size fault"},"pc":{"value":4363298252},"far":{"value":0}}}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 4331159552,
    "size" : 573440,
    "uuid" : "f635824e-318b-3f0c-842c-c369737f2b68",
    "path" : "\/usr\/lib\/dyld",
    "name" : "dyld"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4330143744,
    "CFBundleShortVersionString" : "1.0.0",
    "CFBundleIdentifier" : "com.nahr.baytFinder",
    "size" : 16384,
    "uuid" : "a3edbe5a-2cdd-30fb-bc28-1023668379c8",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Runner",
    "name" : "Runner",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4338024448,
    "size" : 278528,
    "uuid" : "e71713fd-bf2a-3d11-a0e8-94488ca5d57a",
    "path" : "\/Volumes\/VOLUME\/*\/dyld_sim",
    "name" : "dyld_sim"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4365713408,
    "size" : 11698176,
    "uuid" : "a85f987e-4f37-34e4-acd2-901a4da894a8",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Runner.debug.dylib",
    "name" : "Runner.debug.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4330749952,
    "CFBundleShortVersionString" : "2.4.0",
    "CFBundleIdentifier" : "org.cocoapods.FBLPromises",
    "size" : 81920,
    "uuid" : "8c90eba0-7a26-3898-97ba-d42c94491af6",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/FBLPromises.framework\/FBLPromises",
    "name" : "FBLPromises",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4330618880,
    "CFBundleShortVersionString" : "11.10.0",
    "CFBundleIdentifier" : "org.cocoapods.FirebaseAppCheckInterop",
    "size" : 16384,
    "uuid" : "5681973f-9eed-3b03-9669-7b081cad16ce",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/FirebaseAppCheckInterop.framework\/FirebaseAppCheckInterop",
    "name" : "FirebaseAppCheckInterop",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4346888192,
    "CFBundleShortVersionString" : "11.8.1",
    "CFBundleIdentifier" : "org.cocoapods.FirebaseAuth",
    "size" : 1605632,
    "uuid" : "4a0a9ab8-efdd-3478-8cdd-4392d976a3ee",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/FirebaseAuth.framework\/FirebaseAuth",
    "name" : "FirebaseAuth",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4330962944,
    "CFBundleShortVersionString" : "11.10.0",
    "CFBundleIdentifier" : "org.cocoapods.FirebaseAuthInterop",
    "size" : 16384,
    "uuid" : "416b7e45-e496-3bcc-8194-ddaae799ecbf",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/FirebaseAuthInterop.framework\/FirebaseAuthInterop",
    "name" : "FirebaseAuthInterop",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4336566272,
    "CFBundleShortVersionString" : "11.8.1",
    "CFBundleIdentifier" : "org.cocoapods.FirebaseCore",
    "size" : 81920,
    "uuid" : "d3ffb4de-9470-30ec-87cc-f9aacf067a18",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/FirebaseCore.framework\/FirebaseCore",
    "name" : "FirebaseCore",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4331044864,
    "CFBundleShortVersionString" : "11.8.0",
    "CFBundleIdentifier" : "org.cocoapods.FirebaseCoreExtension",
    "size" : 16384,
    "uuid" : "ef1f7b91-4ca2-302f-b8c2-26bfa8948595",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/FirebaseCoreExtension.framework\/FirebaseCoreExtension",
    "name" : "FirebaseCoreExtension",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4337270784,
    "CFBundleShortVersionString" : "11.8.0",
    "CFBundleIdentifier" : "org.cocoapods.FirebaseCoreInternal",
    "size" : 163840,
    "uuid" : "e845c143-efee-3c0d-ba3c-cb1c4aa05316",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/FirebaseCoreInternal.framework\/FirebaseCoreInternal",
    "name" : "FirebaseCoreInternal",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4337745920,
    "CFBundleShortVersionString" : "11.8.0",
    "CFBundleIdentifier" : "org.cocoapods.FirebaseInstallations",
    "size" : 114688,
    "uuid" : "cf78da5d-8deb-383f-923d-9347168daa79",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/FirebaseInstallations.framework\/FirebaseInstallations",
    "name" : "FirebaseInstallations",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4343644160,
    "CFBundleShortVersionString" : "11.8.0",
    "CFBundleIdentifier" : "org.cocoapods.FirebaseMessaging",
    "size" : 278528,
    "uuid" : "e1b7ae38-5d7d-3ba0-a8ae-60dc1c1017ea",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/FirebaseMessaging.framework\/FirebaseMessaging",
    "name" : "FirebaseMessaging",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4343054336,
    "CFBundleShortVersionString" : "4.4.0",
    "CFBundleIdentifier" : "org.cocoapods.GTMSessionFetcher",
    "size" : 327680,
    "uuid" : "6eda53d8-b327-3481-81ab-23049991a6c1",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/GTMSessionFetcher.framework\/GTMSessionFetcher",
    "name" : "GTMSessionFetcher",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4344217600,
    "CFBundleShortVersionString" : "10.1.0",
    "CFBundleIdentifier" : "org.cocoapods.GoogleDataTransport",
    "size" : 196608,
    "uuid" : "c4424e0f-3f58-337b-8de0-edc3b628a08f",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/GoogleDataTransport.framework\/GoogleDataTransport",
    "name" : "GoogleDataTransport",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4344659968,
    "CFBundleShortVersionString" : "8.0.2",
    "CFBundleIdentifier" : "org.cocoapods.GoogleUtilities",
    "size" : 131072,
    "uuid" : "a6dfb638-988f-39ff-8efd-8b49e7f583ff",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/GoogleUtilities.framework\/GoogleUtilities",
    "name" : "GoogleUtilities",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4336336896,
    "CFBundleShortVersionString" : "2.2.0",
    "CFBundleIdentifier" : "org.cocoapods.Mantle",
    "size" : 114688,
    "uuid" : "549f9a0c-2755-3e1f-916f-6394c8c04f2c",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/Mantle.framework\/Mantle",
    "name" : "Mantle",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4336992256,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.onesignal.OneSignalCore",
    "size" : 81920,
    "uuid" : "ee0ac3d0-a44d-36f9-84ec-f0decc83b2e2",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/OneSignalCore.framework\/OneSignalCore",
    "name" : "OneSignalCore",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4344954880,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.onesignal.OneSignalExtension",
    "size" : 49152,
    "uuid" : "7d3cfa19-6067-32fd-a393-679d40361abe",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/OneSignalExtension.framework\/OneSignalExtension",
    "name" : "OneSignalExtension",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4345085952,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.onesignal.OneSignal-Dynamic",
    "size" : 81920,
    "uuid" : "607cbb39-fcb7-3092-b0f1-952d4eaf5d58",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/OneSignalFramework.framework\/OneSignalFramework",
    "name" : "OneSignalFramework",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4345659392,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.onesignal.OneSignalInAppMessages",
    "size" : 163840,
    "uuid" : "1dd4a4c7-1945-382d-9777-c5e1ddd10686",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/OneSignalInAppMessages.framework\/OneSignalInAppMessages",
    "name" : "OneSignalInAppMessages",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4346019840,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.onesignal.OneSignalLiveActivities",
    "size" : 147456,
    "uuid" : "d0b279a5-396a-34df-a92a-d802ef4b53cd",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/OneSignalLiveActivities.framework\/OneSignalLiveActivities",
    "name" : "OneSignalLiveActivities",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4330520576,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.onesignal.OneSignalLocation",
    "size" : 32768,
    "uuid" : "19ff573a-c2fc-3192-a1e9-4676ce3557bd",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/OneSignalLocation.framework\/OneSignalLocation",
    "name" : "OneSignalLocation",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4345282560,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.onesignal.OneSignalNotifications",
    "size" : 65536,
    "uuid" : "149aebfa-1aa9-3e23-b0eb-03c7214b61fa",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/OneSignalNotifications.framework\/OneSignalNotifications",
    "name" : "OneSignalNotifications",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4345462784,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.onesignal.OneSignalOSCore",
    "size" : 98304,
    "uuid" : "df21012a-48f9-3226-bbf4-00870676ba20",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/OneSignalOSCore.framework\/OneSignalOSCore",
    "name" : "OneSignalOSCore",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4346298368,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.onesignal.OneSignalOutcomes",
    "size" : 81920,
    "uuid" : "cd64563b-9290-3d66-8c35-196d7a7c6005",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/OneSignalOutcomes.framework\/OneSignalOutcomes",
    "name" : "OneSignalOutcomes",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4351197184,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.onesignal.OneSignalUser",
    "size" : 311296,
    "uuid" : "84a3d275-7a6e-3089-9543-8251055f37f2",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/OneSignalUser.framework\/OneSignalUser",
    "name" : "OneSignalUser",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4346494976,
    "CFBundleShortVersionString" : "6.0.3",
    "CFBundleIdentifier" : "org.cocoapods.OrderedSet",
    "size" : 49152,
    "uuid" : "3aeba7ba-aa1b-307d-97d7-aa1fd99e38d3",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/OrderedSet.framework\/OrderedSet",
    "name" : "OrderedSet",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4352737280,
    "CFBundleShortVersionString" : "3.8.0",
    "CFBundleIdentifier" : "org.cocoapods.PhoneNumberKit",
    "size" : 491520,
    "uuid" : "0011ee8c-52b6-381e-bfc3-81480e1b0d62",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/PhoneNumberKit.framework\/PhoneNumberKit",
    "name" : "PhoneNumberKit",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4336877568,
    "CFBundleShortVersionString" : "100.0.0",
    "CFBundleIdentifier" : "org.cocoapods.RecaptchaInterop",
    "size" : 16384,
    "uuid" : "e5c1127d-a4a8-3b98-937b-fb4ec4d4d5c9",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/RecaptchaInterop.framework\/RecaptchaInterop",
    "name" : "RecaptchaInterop",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4353818624,
    "CFBundleShortVersionString" : "5.21.0",
    "CFBundleIdentifier" : "org.cocoapods.SDWebImage",
    "size" : 524288,
    "uuid" : "5deed453-e0e1-38da-ad1c-e4421e9cd163",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/SDWebImage.framework\/SDWebImage",
    "name" : "SDWebImage",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4350722048,
    "CFBundleShortVersionString" : "0.14.6",
    "CFBundleIdentifier" : "org.cocoapods.SDWebImageWebPCoder",
    "size" : 49152,
    "uuid" : "72480e7f-7c4a-35e6-921b-ec6be86ea1ac",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/SDWebImageWebPCoder.framework\/SDWebImageWebPCoder",
    "name" : "SDWebImageWebPCoder",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4350869504,
    "CFBundleShortVersionString" : "0.0.1",
    "CFBundleIdentifier" : "org.cocoapods.audio-session",
    "size" : 65536,
    "uuid" : "3cf49c99-8d57-318e-bce4-bc9a7fa0cd8f",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/audio_session.framework\/audio_session",
    "name" : "audio_session",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4351033344,
    "CFBundleShortVersionString" : "0.0.1",
    "CFBundleIdentifier" : "org.cocoapods.connectivity-plus",
    "size" : 49152,
    "uuid" : "55d90f8a-3b45-3dd4-a63f-e426773f31b1",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/connectivity_plus.framework\/connectivity_plus",
    "name" : "connectivity_plus",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4336779264,
    "CFBundleShortVersionString" : "0.0.1",
    "CFBundleIdentifier" : "org.cocoapods.device-info-plus",
    "size" : 32768,
    "uuid" : "175f835e-ff96-3d5c-aabb-bedbdb086fb5",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/device_info_plus.framework\/device_info_plus",
    "name" : "device_info_plus",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4352098304,
    "CFBundleShortVersionString" : "1.0.0",
    "CFBundleIdentifier" : "org.cocoapods.flutter-image-compress-common",
    "size" : 147456,
    "uuid" : "48155d77-5fd0-3d88-b30d-ea80d7aa5f96",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/flutter_image_compress_common.framework\/flutter_image_compress_common",
    "name" : "flutter_image_compress_common",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4358766592,
    "CFBundleShortVersionString" : "0.0.1",
    "CFBundleIdentifier" : "org.cocoapods.flutter-inappwebview-ios",
    "size" : 1785856,
    "uuid" : "39f95f3e-44f7-30dd-9e8d-6ce7a2825eb1",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/flutter_inappwebview_ios.framework\/flutter_inappwebview_ios",
    "name" : "flutter_inappwebview_ios",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4351655936,
    "CFBundleShortVersionString" : "0.0.1",
    "CFBundleIdentifier" : "org.cocoapods.flutter-localization",
    "size" : 32768,
    "uuid" : "dc9b8515-8f94-3abe-a6e4-c1158c78d853",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/flutter_localization.framework\/flutter_localization",
    "name" : "flutter_localization",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4351770624,
    "CFBundleShortVersionString" : "0.0.2",
    "CFBundleIdentifier" : "org.cocoapods.fluttertoast",
    "size" : 49152,
    "uuid" : "a243ccb1-6206-3cc1-8a1d-ce16ca2807e8",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/fluttertoast.framework\/fluttertoast",
    "name" : "fluttertoast",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4351918080,
    "CFBundleShortVersionString" : "1.0.5",
    "CFBundleIdentifier" : "org.cocoapods.geocoding-ios",
    "size" : 32768,
    "uuid" : "a547b692-98cd-39bd-bd73-c721ee75cdcb",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/geocoding_ios.framework\/geocoding_ios",
    "name" : "geocoding_ios",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4352524288,
    "CFBundleShortVersionString" : "1.2.0",
    "CFBundleIdentifier" : "org.cocoapods.geolocator-apple",
    "size" : 49152,
    "uuid" : "baeadef7-9499-3ae9-a06a-3cd4799a8d81",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/geolocator_apple.framework\/geolocator_apple",
    "name" : "geolocator_apple",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4354867200,
    "CFBundleShortVersionString" : "0.0.1",
    "CFBundleIdentifier" : "org.cocoapods.image-picker-ios",
    "size" : 81920,
    "uuid" : "d6138948-9f47-3854-b9ed-f60ab9c26c92",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/image_picker_ios.framework\/image_picker_ios",
    "name" : "image_picker_ios",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4355080192,
    "CFBundleShortVersionString" : "0.0.1",
    "CFBundleIdentifier" : "org.cocoapods.just-audio",
    "size" : 98304,
    "uuid" : "5dd6102e-e0fa-3f2c-83f1-17cbb5a58832",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/just_audio.framework\/just_audio",
    "name" : "just_audio",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4355293184,
    "CFBundleShortVersionString" : "0.0.1",
    "CFBundleIdentifier" : "org.cocoapods.libphonenumber-plugin",
    "size" : 49152,
    "uuid" : "e6d697ad-d3be-3c5e-b656-16beb680cf6e",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/libphonenumber_plugin.framework\/libphonenumber_plugin",
    "name" : "libphonenumber_plugin",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4356456448,
    "CFBundleShortVersionString" : "1.5.0",
    "CFBundleIdentifier" : "org.cocoapods.libwebp",
    "size" : 688128,
    "uuid" : "245ec6b6-2b95-3412-8ff6-d30e35442cc5",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/libwebp.framework\/libwebp",
    "name" : "libwebp",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4355440640,
    "CFBundleShortVersionString" : "0.0.1",
    "CFBundleIdentifier" : "org.cocoapods.maps-launcher",
    "size" : 32768,
    "uuid" : "2d6796bf-ac5a-3388-93ee-83cd7c23e176",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/maps_launcher.framework\/maps_launcher",
    "name" : "maps_launcher",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4346773504,
    "CFBundleShortVersionString" : "3.30910.0",
    "CFBundleIdentifier" : "org.cocoapods.nanopb",
    "size" : 32768,
    "uuid" : "00e2affe-f44c-3b22-81e0-f696926288f9",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/nanopb.framework\/nanopb",
    "name" : "nanopb",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4337188864,
    "CFBundleShortVersionString" : "0.4.5",
    "CFBundleIdentifier" : "org.cocoapods.package-info-plus",
    "size" : 16384,
    "uuid" : "98815a14-2a9e-3c83-94fb-982e5c20a347",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/package_info_plus.framework\/package_info_plus",
    "name" : "package_info_plus",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4355735552,
    "CFBundleShortVersionString" : "0.0.1",
    "CFBundleIdentifier" : "org.cocoapods.path-provider-foundation",
    "size" : 49152,
    "uuid" : "c01bbc15-950f-3a3a-9089-2fe0c4e9e9d8",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/path_provider_foundation.framework\/path_provider_foundation",
    "name" : "path_provider_foundation",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4346658816,
    "CFBundleShortVersionString" : "0.0.1",
    "CFBundleIdentifier" : "org.cocoapods.share-plus",
    "size" : 32768,
    "uuid" : "49cdac4c-5cef-3332-bce6-cc058d7d26ef",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/share_plus.framework\/share_plus",
    "name" : "share_plus",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4356145152,
    "CFBundleShortVersionString" : "0.0.1",
    "CFBundleIdentifier" : "org.cocoapods.shared-preferences-foundation",
    "size" : 81920,
    "uuid" : "faedb881-511a-3786-9b1d-a6c9cb04c612",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/shared_preferences_foundation.framework\/shared_preferences_foundation",
    "name" : "shared_preferences_foundation",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4357767168,
    "CFBundleShortVersionString" : "0.0.4",
    "CFBundleIdentifier" : "org.cocoapods.sqflite-darwin",
    "size" : 131072,
    "uuid" : "c53b19ac-0a06-3492-9fb5-91756da4cba8",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/sqflite_darwin.framework\/sqflite_darwin",
    "name" : "sqflite_darwin",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4355899392,
    "CFBundleShortVersionString" : "0.0.1",
    "CFBundleIdentifier" : "org.cocoapods.url-launcher-ios",
    "size" : 81920,
    "uuid" : "753e4318-946e-32dc-a8d7-81a364ad552d",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/url_launcher_ios.framework\/url_launcher_ios",
    "name" : "url_launcher_ios",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4358062080,
    "CFBundleShortVersionString" : "0.0.1",
    "CFBundleIdentifier" : "org.cocoapods.video-player-avfoundation",
    "size" : 81920,
    "uuid" : "a158ae9d-baeb-39a4-bd2f-a4209ebbf3d1",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/video_player_avfoundation.framework\/video_player_avfoundation",
    "name" : "video_player_avfoundation",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4357455872,
    "CFBundleShortVersionString" : "0.0.1",
    "CFBundleIdentifier" : "org.cocoapods.wakelock-plus",
    "size" : 32768,
    "uuid" : "31f019a8-709e-3c90-8475-03814e4efd62",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/wakelock_plus.framework\/wakelock_plus",
    "name" : "wakelock_plus",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4388503552,
    "CFBundleShortVersionString" : "0.0.1",
    "CFBundleIdentifier" : "org.cocoapods.webview-flutter-wkwebview",
    "size" : 655360,
    "uuid" : "9a2cebf5-7287-37d3-a767-202ae88cd3ad",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/webview_flutter_wkwebview.framework\/webview_flutter_wkwebview",
    "name" : "webview_flutter_wkwebview",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4440702976,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "io.flutter.flutter",
    "size" : 35651584,
    "uuid" : "4c4c44df-5555-3144-a127-936867ca2f59",
    "path" : "\/Users\/USER\/Library\/Developer\/CoreSimulator\/Devices\/56CC3D44-A735-46A3-96E2-3B8F6B4CA5DD\/data\/Containers\/Bundle\/Application\/160DF5A7-82F1-467D-85A3-5B58C6E81ADC\/Runner.app\/Frameworks\/Flutter.framework\/Flutter",
    "name" : "Flutter",
    "CFBundleVersion" : "1.0"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4355555328,
    "size" : 32768,
    "uuid" : "3394e9ca-eb51-322d-a5eb-4d895d3b1c14",
    "path" : "\/usr\/lib\/system\/libsystem_platform.dylib",
    "name" : "libsystem_platform.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4358275072,
    "size" : 245760,
    "uuid" : "0f9f96fe-6b1c-3253-a33a-c9e4a0c2a386",
    "path" : "\/usr\/lib\/system\/libsystem_kernel.dylib",
    "name" : "libsystem_kernel.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4363288576,
    "size" : 65536,
    "uuid" : "3df3256f-466e-37bc-b995-a5a9956e1415",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4332470272,
    "size" : 49152,
    "uuid" : "a31fa6bc-f00c-3232-9da8-4e5d7922ed9a",
    "path" : "\/Volumes\/VOLUME\/*\/libobjc-trampolines.dylib",
    "name" : "libobjc-trampolines.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 6443487232,
    "size" : 507892,
    "uuid" : "3e34edd7-d111-3f74-bacd-9a4e955d66e6",
    "path" : "\/Volumes\/VOLUME\/*\/libsystem_c.dylib",
    "name" : "libsystem_c.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 6445170688,
    "size" : 114688,
    "uuid" : "d72e40f3-f7a1-329e-938b-c99e263e665f",
    "path" : "\/Volumes\/VOLUME\/*\/libc++abi.dylib",
    "name" : "libc++abi.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 6442876928,
    "size" : 245076,
    "uuid" : "9ee78930-1d2d-365d-8cdd-fe423f3c769c",
    "path" : "\/Volumes\/VOLUME\/*\/libobjc.A.dylib",
    "name" : "libobjc.A.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 6443995136,
    "size" : 282624,
    "uuid" : "d5e90ee3-9c77-3808-a2ca-3e15e11a9aa1",
    "path" : "\/Volumes\/VOLUME\/*\/libdispatch.dylib",
    "name" : "libdispatch.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 6446174208,
    "CFBundleShortVersionString" : "6.9",
    "CFBundleIdentifier" : "com.apple.CoreFoundation",
    "size" : 3989504,
    "uuid" : "e965e773-9803-3e02-8243-5cb8f4365f11",
    "path" : "\/Volumes\/VOLUME\/*\/CoreFoundation.framework\/CoreFoundation",
    "name" : "CoreFoundation",
    "CFBundleVersion" : "3208"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 6717054976,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.apple.GraphicsServices",
    "size" : 36864,
    "uuid" : "9c82f9b7-b20c-3255-80a1-c4a1e74ef754",
    "path" : "\/Volumes\/VOLUME\/*\/GraphicsServices.framework\/GraphicsServices",
    "name" : "GraphicsServices",
    "CFBundleVersion" : "1.0"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 6523006976,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.apple.UIKitCore",
    "size" : 30662656,
    "uuid" : "24ff1688-4bc4-3da8-8f17-c73d22f96263",
    "path" : "\/Volumes\/VOLUME\/*\/UIKitCore.framework\/UIKitCore",
    "name" : "UIKitCore",
    "CFBundleVersion" : "8220.1.104"
  },
  {
    "size" : 0,
    "source" : "A",
    "base" : 0,
    "uuid" : "00000000-0000-0000-0000-000000000000"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 6450683904,
    "CFBundleShortVersionString" : "6.9",
    "CFBundleIdentifier" : "com.apple.Foundation",
    "size" : 12832768,
    "uuid" : "b8e40415-c88f-3ceb-971c-82679743b9be",
    "path" : "\/Volumes\/VOLUME\/*\/Foundation.framework\/Foundation",
    "name" : "Foundation",
    "CFBundleVersion" : "3208"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 7349264384,
    "CFBundleShortVersionString" : "1.0.0",
    "CFBundleIdentifier" : "com.apple.texttospeech",
    "size" : 2015232,
    "uuid" : "2a4c6531-93f1-32c7-99f4-5e0b86154e2c",
    "path" : "\/Volumes\/VOLUME\/*\/TextToSpeech.framework\/TextToSpeech",
    "name" : "TextToSpeech",
    "CFBundleVersion" : "1.0"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 6517923840,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.apple.CFNetwork",
    "size" : 3678208,
    "uuid" : "28f30cff-18c1-3fb9-b1e9-e185e004ac74",
    "path" : "\/Volumes\/VOLUME\/*\/CFNetwork.framework\/CFNetwork",
    "name" : "CFNetwork",
    "CFBundleVersion" : "1568.300.101"
  }
],
  "sharedCache" : {
  "base" : 6442450944,
  "size" : 3878813696,
  "uuid" : "ad0f062c-15e5-37fd-ba08-68adc27a7106"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=1.7G resident=0K(0%) swapped_out_or_unallocated=1.7G(100%)\nWritable regions: Total=874.5M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=874.5M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nActivity Tracing                   256K        1 \nColorSync                          128K        5 \nFoundation                          16K        1 \nIOSurface                         36.5M        4 \nKernel Alloc Once                   32K        1 \nMALLOC                           618.1M       79 \nMALLOC guard page                  192K       12 \nSQLite page cache                  640K        5 \nSTACK GUARD                       56.5M       29 \nStack                             35.0M       32 \nVM_ALLOCATE                      198.9M      480 \n__DATA                            41.7M      935 \n__DATA_CONST                     104.1M      953 \n__DATA_DIRTY                       107K       12 \n__FONT_DATA                        2352        1 \n__LINKEDIT                       715.7M       62 \n__OBJC_RW                         2703K        1 \n__TEXT                             1.0G      967 \n__TPRO_CONST                       292K        2 \ndyld private memory                2.5G       12 \nlibnetwork                         128K        8 \nmapped file                      135.6M       29 \nshared memory                       16K        1 \n===========                     =======  ======= \nTOTAL                              5.5G     3632 \n",
  "legacyInfo" : {
  "threadTriggered" : {
    "queue" : "com.apple.main-thread"
  }
},
  "logWritingSignature" : "9dc62371222ed5e616cc9f7d1fbf54a00f0faa84",
  "trialInfo" : {
  "rollouts" : [
    {
      "rolloutId" : "6112d17137f5d11121dcd4e2",
      "factorPackIds" : {

      },
      "deploymentId" : 240000570
    },
    {
      "rolloutId" : "60f8ddccefea4203d95cbeef",
      "factorPackIds" : {

      },
      "deploymentId" : 240000025
    }
  ],
  "experiments" : [

  ]
}
}

Model: Macmini9,1, BootROM 10151.140.19, proc 8:4:4 processors, 8 GB, SMC 
Graphics: Apple M1, Apple M1, Built-In
Display: spdisplays_display, 1920 x 1080 (1080p FHD - Full High Definition), Main, MirrorOff, Online
Memory Module: LPDDR4, Hynix
AirPort: spairport_wireless_card_type_wifi (0x14E4, 0x4378), wl0: Jan 13 2024 03:06:59 version 18.20.440.9.7.8.167 FWID 01-7be24857
AirPort: 
Bluetooth: Version (null), 0 services, 0 devices, 0 incoming serial ports
Network Service: Wi-Fi, AirPort, en1
USB Device: USB31Bus
USB Device: USB31Bus
USB Device: USB30Bus
USB Device: CASUE USB Keyboard
Thunderbolt Bus: Mac mini, Apple Inc.
Thunderbolt Bus: Mac mini, Apple Inc.
