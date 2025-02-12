import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/core/themes/app_colors.dart';
import 'package:teste_tecnico_guia_de_moteis/core/themes/app_text_styles.dart';
import 'package:teste_tecnico_guia_de_moteis/domain/models/motel_model.dart';

class AppCardMotel extends StatelessWidget {
  final MotelModel motelModel;

  const AppCardMotel({
    super.key,
    required this.motelModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                motelModel.fantasia,
                style: AppTextStyles.big(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.favorite,
                color: AppColors.redLight,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            motelModel.bairro,
            style: AppTextStyles.medium(),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                motelModel.qtdFavoritos.toString(),
                style: AppTextStyles.medium(),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 16),
          motelModel.suites.isNotEmpty
              ? SizedBox(
                  height: 300 + calculatePeriodos(motelModel.suites),
                  child: PageView(
                    children: motelModel.suites.map((suite) {
                      return Column(
                        children: [
                          Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 200,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(suite.fotos.first),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      suite.nome,
                                      style: AppTextStyles.medium(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: suite.periodos
                                .map(
                                  (e) => Card(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                        horizontal: 16
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  '${e.tempo} horas',
                                                  style: AppTextStyles.big(),
                                                ),
                                                Text(
                                                  "R\$ ${replaceCurrency(e.valorTotal)}",
                                                  style: AppTextStyles.big(),
                                                ),
                                              ],
                                            ),
                                            const Icon(
                                              Icons.chevron_right_rounded,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      );
                    }).toList(),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

double calculatePeriodos(List<SuiteModel> suites) {
  int length = suites
      .reduce((a, b) => a.periodos.length > b.periodos.length ? a : b)
      .periodos
      .length;

  return length * 150;
}

String replaceCurrency(double value) {
  return value.toString().replaceAll('.', ',');
}
