
const linkShareInfo = document.getElementById("link-compartir-info");
// Función para convertir el formato /Date(...) a un objeto Date de JavaScript
function convertToDate(dateString) {
    const timestamp = parseInt(dateString.replace(/\/Date\((\d+)\)\//, '$1'));
    const date = new Date(timestamp);

    // Obtener los componentes de la fecha
    const year = date.getFullYear();
    const month = ('0' + (date.getMonth() + 1)).slice(-2); // Obtener mes con padding
    const day = ('0' + date.getDate()).slice(-2); // Obtener día con padding

    // Formatear la fecha como 'YYYY-MM-DD'
    return `${year}-${month}-${day}`;
}

function recoverData() {
    // Obtener datos del HiddenField
    const container = document.getElementById('chartContainer');
    const campoField = container.getElementsByTagName("input")[0];
    const dataHF = JSON.parse(campoField.value);
    // Convertir las fechas al formato de Date de JavaScript
    dataHF.forEach(item => {
        item.fechaActualizacion = convertToDate(item.fechaActualizacion);
    });
    return dataHF;
}


let chartInstance; // Declarar chartInstance como variable global

// Función para mostrar el gráfico
function showGraph(selectedOption) {
    let cotizaciones = recoverData();
    if (cotizaciones.length > 0) {
        console.log("Hay cotizaciones para mostrar");
    } else {
        console.log("No hay cotizaciones para mostrar");
        Swal.fire({
            title: "Sin datos",
            text: "No hay cotizaciones guardadas para la moneda seleccionada.",
            icon: "warning",
        });
    }
    // Destruir el gráfico anterior si ya existe
    if (chartInstance) {
        chartInstance.destroy();
    }
    //con sort ordenamos los datos por fecha de mas actual a menos actual basandonos en la fecha de actualizacion
    cotizaciones.sort(
        (a, b) => new Date(a.fechaActualizacion) - new Date(b.fechaActualizacion)
    );
    // Crear un objeto para almacenar los datos que vamos a usar para el gráfico
    const data = {};

    // Iterar sobre cada cotización para organizar los datos
    cotizaciones.forEach((item) => {
        // Crear una clave única para cada combinación de moneda y casa de cambio
        const key = `${item.moneda}-${item.casa}`;
        // Si la clave no existe en el objeto data, inicializar con arrays vacíos
        if (!data[key]) {
            data[key] = {
                labels: [],
                prices: [],
                salePrices: [],
            };
        }
        // Añadir los datos de la cotización actual a los arrays correspondientes
        data[key].labels.push(item.fechaActualizacion); // Fechas de actualización
        data[key].prices.push(item.compra); // Precios de compra
        data[key].salePrices.push(item.venta); // Precios de venta
    });

    // Crear los conjuntos de datos (datasets) para el chart basándonos en los datos preparados
    const datasets = Object.keys(data).map((key) => {
        const [moneda, casa] = key.split("-");
        return {
            label: `${moneda} (${casa}) - Compra`,
            data: data[key].prices, // Datos de precios de compra
            fill: false, // No rellenar el área bajo la línea
            borderColor: getRandomColor(), // Color aleatorio para la línea
            tension: 0.4, // Suavizar la línea del gráfico
        };
    });

    // Si la opción seleccionada no es 0, añadir datasets para los precios de venta
    if (selectedOption > 0) {
        const saleDatasets = Object.keys(data).map((key) => {
            const [moneda, casa] = key.split("-");
            return {
                label: `${moneda} (${casa}) - Venta`,
                data: data[key].salePrices, // Datos de precios de venta
                fill: false, // No rellenar el área bajo la línea
                borderColor: getRandomColor(), // Color aleatorio para la línea
                tension: 0.4, // Suavizar la línea del gráfico
            };
        });
        // Añadir los datasets de venta a los datasets existentes
        datasets.push(...saleDatasets);
    }

    // Acceder al elemento canvas
    const ctx = document.getElementById("cotizaciones-chart").getContext('2d');
    // Crear una nueva instancia de Chart.js para dibujar el gráfico
    chartInstance = new Chart(ctx, {
        type: "line", // Tipo de gráfico: línea
        data: {
            labels: data[Object.keys(data)[0]].labels, // Usar las etiquetas (fechas) del primer conjunto de datos
            datasets: datasets, // Conjuntos de datos para el gráfico
        },
        options: {
            responsive: true, // Hacer que el gráfico sea responsivo
            plugins: {
                tooltip: {
                    mode: "index", // Mostrar tooltips por índice
                    intersect: false, // No requerir intersección para mostrar tooltips
                },
            },
            scales: {
                x: {
                    display: true, // Mostrar eje X
                    title: {
                        display: true, // Mostrar título del eje X
                        text: "Fecha de Actualización", // Texto del título del eje X
                    },
                },
                y: {
                    display: true, // Mostrar eje Y
                    title: {
                        display: true, // Mostrar título del eje Y
                        text: selectedOption === 0 ? "Precio de Compra" : "Precio", // Texto del título del eje Y
                    },
                },
            },
        },
    });
}

// Función para generar colores aleatorios
function getRandomColor() {
    const letters = "0123456789ABCDEF";
    let color = "#";
    for (let i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}
