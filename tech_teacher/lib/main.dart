import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tech_teacher/core/app_colors.dart';
import 'package:tech_teacher/features/chat/presentation/pages/chat_page.dart';
import 'package:tech_teacher/features/chat/data/datasources/chat_datasource_impl.dart';
import 'package:tech_teacher/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:tech_teacher/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:tech_teacher/features/chat/presentation/stores/chat_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(MultiProvider(
      providers: [
        Provider<ChatDatasourceImpl>(
          create: (_) => ChatDatasourceImpl(),
        ),
        Provider<ChatRepositoryImpl>(
          create: (context) => ChatRepositoryImpl(context.read<ChatDatasourceImpl>()),
        ),
        Provider<SendMessageUseCase>(
          create: (context) => SendMessageUseCase(context.read<ChatRepositoryImpl>()),
        ),
        Provider<ChatStore>(
          create: (context) => ChatStore(context.read<SendMessageUseCase>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechTeacher',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryBlue),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ChatPage(),
    );
  }
}
