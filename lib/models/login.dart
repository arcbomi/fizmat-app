class FizLoginInfo {
  final bool isAgreeFizTerms;

  // 公有的构造函数
  const FizLoginInfo({required this.isAgreeFizTerms});

  // 单例实例
  static const FizLoginInfo getFizLoginConfig = FizLoginInfo(
    isAgreeFizTerms: true,
  );
}
