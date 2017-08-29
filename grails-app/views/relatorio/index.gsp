<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    %{--<asset:javascript src="prf/jquery.js"/>   Removido pois já está inserido no sistema  --}%
    <asset:javascript src="sobreaviso.js"/>
    <asset:stylesheet src="datepicker/css/bootstrap-datepicker.css"/>
    %{--<asset:stylesheet src="grails-app/assets/stylesheets/rudsom.css"/>--}%
    <asset:javascript src="datepicker/js/bootstrap-datepicker.min.js"/>
    <asset:javascript src="datepicker/locales/bootstrap-datepicker.pt-BR.min.js"/>
    <style>
    /*input[type=text] {*/
        /*width: auto;*/
        /*padding: 1px 1px;*/
        /*box-sizing: border-box;*/
        /*border: none;*/
        /*background-color: #ffffff;*/
        /*box-shadow: none;*/
        /*text-align: center;*/
        /*font-weight: bold;*/
        /*font-size: xx-small;*/
    /*}*/
    input[id=dataHistorico]{
        width: auto;
        text-align: center;
        font-weight: bold;
        font-size: xx-small;
    }
    span[id=R] {
        color: #0000FF;
    }
    .col-md-6{
        text-align: center;
        /*color: red;*/
    }
    span[id=colunas] {
        color: red;
    }
    .table th, .table td {
        text-align: center;
    }


    /*input[name=checkListI] {*/
    /*color: #0000FF;*/
    /*outline: 2px solid green;*/
    /*}*/
    /*input[name=checkListR] {*/
    /*color: #0000FF;*/
    /*outline: 2px solid blue;*/
    /*}*/
    /*input[name=checkListT] {*/
    /*color: #0000FF;*/
    /*outline: 2px solid red;*/
    /*}*/

    input[id=datepicker] {
        font-size: 14px;
        line-height: 1.428571429
    }

    </style>

</head>
<body>






<!-- Conteúdo da página    ================================================== -->
<div id="page-content" class="clearfix fixed">
    ﻿
    <div class="page-header">
        <h1> Sobreaviso
            <small><i class="icon-double-angle-right"></i> Sistema de Abertura e Acompanhamento de Chamados - NUTEL-RN</small>
        </h1>
    </div>
    <div class="box">
        <div align="center">
            <br>
            <g:form>
                ATENDENTE:
                <g:select name="atendente" optionKey="nome" optionValue="nome"
                          from="${sobreavisonutel.Atendentes.listOrderByNome()}"
                />
                <br><br>
                <div class="input-daterange" id="calendario" >
                    PERÍODO:
                    <input type="text" class="input-small" name="dataInicio" />
                    <span class="add-on" style="vertical-align: top; height:20px"> ATÉ </span>
                    <input type="text" class="input-small" name="dataFim" />
                </div>
                <br>
                <div align="center" name="gerarBtn">
                    <g:actionSubmit value="Gerar" action="gerador"/>
                </div>
            </g:form>
        <br>
        </div>
        <div>
            <g:if test="${horasTotal > 0}">
                <table align="center" id="tabelaRelatorio" class="table table-condensed" style="width:30%">
                    <tr>
                        <th colspan="3"><b> ${atendente} - ${formatDate(format:'dd-MM-yyyy',date:dataInicio)} à ${formatDate(format:'dd-MM-yyyy',date:dataFim)}</b></th>
                    </tr>
                    <th class="col-md-4">Data</th>
                    <th class="col-md-4">Período</th>
                    <th class="col-md-4">Horas em sobreaviso</th>
                    <g:each var="relatorio" status="j" in="${listaBusca}">
                        <tr align="center">
                            <td> ${formatDate(format:'dd-MM-yyyy',date:relatorio.data)} </td>
                            <td> ${relatorio.periodo} </td>
                            <td> ${relatorio.hora} </td>
                        </tr>
                    </g:each>
                    <tr>
                        <td colspan="2"><b>Total em sobreaviso</b></td>
                        <td><b>${horasTotal} horas</b></td>
                    </tr>
                </table>
            </g:if>
        </div>
        <br>

        <div id="alertaData" class="alert alert-danger" role="alert">
            <strong>Operação não permitida!</strong> O campo data deve ser preenchido antes de alterar.
        </div>
    </div>

</div>
<!-- Fim do conteúdo da página ================================================== -->



<g:javascript>



   $(document).ready(function() {
        $('#alertaData').hide()
        $('#gerarBtn').on('click',function (e) {
            alert("O campo data deve ser preenchido!");
            if($('#dataInicio').val().length == 0){
                e.preventDefault()
                $('#alertaData').show()
                alert("O campo data deve ser preenchido!");
            }
        });

       $('#calendario').datepicker({
           language: "pt-BR",
           format: "dd/mm/yyyy",
           clearBtn: true,
           todayHighlight: true,
           orientation: "bottom left"
       });

       $('#calendario').on('change',function(){
           var periodo = $('#calendario').val();
           //alert(periodo);
       });


   });
</g:javascript>
</body>
</html>