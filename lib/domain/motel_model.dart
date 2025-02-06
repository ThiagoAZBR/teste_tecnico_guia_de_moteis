import 'dart:convert';

class DefaultModel {
  final bool sucesso;
  final DataModel data;
  final List<String>? mensagem;

  DefaultModel({
    required this.sucesso,
    required this.data,
    required this.mensagem,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'sucesso': sucesso});
    result.addAll({'data': data.toMap()});
    if (mensagem != null) {
      result.addAll({'mensagem': mensagem});
    }

    return result;
  }

  factory DefaultModel.fromMap(Map<String, dynamic> map) {
    return DefaultModel(
      sucesso: map['sucesso'] ?? false,
      data: DataModel.fromMap(map['data']),
      mensagem: List<String>.from(map['mensagem']),
    );
  }
}

class DataModel {
  final int pagina;
  final int qtdPorPagina;
  final int totalSuites;
  final int totalMoteis;
  final int raio;
  final double maxPaginas;
  final List<MotelModel> moteis;

  DataModel({
    required this.pagina,
    required this.qtdPorPagina,
    required this.totalSuites,
    required this.totalMoteis,
    required this.raio,
    required this.maxPaginas,
    required this.moteis,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'pagina': pagina});
    result.addAll({'qtdPorPagina': qtdPorPagina});
    result.addAll({'totalSuites': totalSuites});
    result.addAll({'totalMoteis': totalMoteis});
    result.addAll({'raio': raio});
    result.addAll({'maxPaginas': maxPaginas});
    result.addAll({'moteis': moteis.map((x) => x.toMap()).toList()});

    return result;
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      pagina: map['pagina']?.toInt() ?? 0,
      qtdPorPagina: map['qtdPorPagina']?.toInt() ?? 0,
      totalSuites: map['totalSuites']?.toInt() ?? 0,
      totalMoteis: map['totalMoteis']?.toInt() ?? 0,
      raio: map['raio']?.toInt() ?? 0,
      maxPaginas: map['maxPaginas']?.toDouble() ?? 0.0,
      moteis: List<MotelModel>.from(
          map['moteis']?.map((x) => MotelModel.fromMap(x))),
    );
  }
}

class MotelModel {
  final String fantasia;
  final String logo;
  final String bairro;
  final double distancia;
  final int qtdFavoritos;
  final List<SuiteModel> suites;

  MotelModel({
    required this.fantasia,
    required this.logo,
    required this.bairro,
    required this.distancia,
    required this.qtdFavoritos,
    required this.suites,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'fantasia': fantasia});
    result.addAll({'logo': logo});
    result.addAll({'bairro': bairro});
    result.addAll({'distancia': distancia});
    result.addAll({'qtdFavoritos': qtdFavoritos});
    result.addAll({'suites': suites.map((x) => x.toMap()).toList()});

    return result;
  }

  factory MotelModel.fromMap(Map<String, dynamic> map) {
    return MotelModel(
      fantasia: map['fantasia'] ?? '',
      logo: map['logo'] ?? '',
      bairro: map['bairro'] ?? '',
      distancia: map['distancia']?.toDouble() ?? 0.0,
      qtdFavoritos: map['qtdFavoritos']?.toInt() ?? 0,
      suites: List<SuiteModel>.from(
          map['suites']?.map((x) => SuiteModel.fromMap(x))),
    );
  }
}

class SuiteModel {
  final String nome;
  final int qtd;
  final bool exibirQtdDisponiveis;
  final List<String> fotos;
  final List<ItemModel> itens;
  final List<CategoriaItemModel> categoriaItens;
  final List<PeriodoModel> periodos;

  SuiteModel(
      {required this.nome,
      required this.qtd,
      required this.exibirQtdDisponiveis,
      required this.fotos,
      required this.itens,
      required this.categoriaItens,
      required this.periodos});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'nome': nome});
    result.addAll({'qtd': qtd});
    result.addAll({'exibirQtdDisponiveis': exibirQtdDisponiveis});
    result.addAll({'fotos': fotos});
    result.addAll({'itens': itens.map((x) => x.toMap()).toList()});
    result.addAll(
        {'categoriaItens': categoriaItens.map((x) => x.toMap()).toList()});
    result.addAll({'periodos': periodos.map((x) => x.toMap()).toList()});

    return result;
  }

  factory SuiteModel.fromMap(Map<String, dynamic> map) {
    return SuiteModel(
      nome: map['nome'] ?? '',
      qtd: map['qtd']?.toInt() ?? 0,
      exibirQtdDisponiveis: map['exibirQtdDisponiveis'] ?? false,
      fotos: List<String>.from(map['fotos']),
      itens:
          List<ItemModel>.from(map['itens']?.map((x) => ItemModel.fromMap(x))),
      categoriaItens: List<CategoriaItemModel>.from(
          map['categoriaItens']?.map((x) => CategoriaItemModel.fromMap(x))),
      periodos: List<PeriodoModel>.from(
          map['periodos']?.map((x) => PeriodoModel.fromMap(x))),
    );
  }
}

class ItemModel {
  final String nome;

  ItemModel({required this.nome});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'nome': nome});

    return result;
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      nome: map['nome'] ?? '',
    );
  }
}

class CategoriaItemModel {
  final String nome;
  final String icone;

  CategoriaItemModel({required this.nome, required this.icone});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'nome': nome});
    result.addAll({'icone': icone});

    return result;
  }

  factory CategoriaItemModel.fromMap(Map<String, dynamic> map) {
    return CategoriaItemModel(
      nome: map['nome'] ?? '',
      icone: map['icone'] ?? '',
    );
  }
}

class PeriodoModel {
  final String tempoFormatado;
  final String tempo;
  final double valor;
  final double valorTotal;
  final bool temCortesia;
  final DescontoModel? desconto;

  PeriodoModel({
    required this.tempoFormatado,
    required this.tempo,
    required this.valor,
    required this.valorTotal,
    required this.temCortesia,
    required this.desconto,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'tempoFormatado': tempoFormatado});
    result.addAll({'tempo': tempo});
    result.addAll({'valor': valor});
    result.addAll({'valorTotal': valorTotal});
    result.addAll({'temCortesia': temCortesia});
    if(desconto != null){
      result.addAll({'desconto': desconto!.toMap()});
    }
  
    return result;
  }

  factory PeriodoModel.fromMap(Map<String, dynamic> map) {
    return PeriodoModel(
      tempoFormatado: map['tempoFormatado'] ?? '',
      tempo: map['tempo'] ?? '',
      valor: map['valor']?.toDouble() ?? 0.0,
      valorTotal: map['valorTotal']?.toDouble() ?? 0.0,
      temCortesia: map['temCortesia'] ?? false,
      desconto: map['desconto'] != null ? DescontoModel.fromMap(map['desconto']) : null,
    );
  }
}

class DescontoModel {
  final double desconto;

  DescontoModel({required this.desconto});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'desconto': desconto});

    return result;
  }

  factory DescontoModel.fromMap(Map<String, dynamic> map) {
    return DescontoModel(
      desconto: map['desconto']?.toDouble() ?? 0.0,
    );
  }
}
