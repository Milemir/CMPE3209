/* Mirac Alademiroğlu, 5001240027, G1 (4g Optimize Edilmiş Versiyon - Loop Fusion) */
#define N 26
#define R 80
#define B 50

const int SID = 1240027;
unsigned int alarm_count = 0;
int first_alarm_idx = -1;
int arr[N];

int mov_avg(int p3, int p2, int p1, int cur, int idx) {
    if (idx == 0) return cur;
    if (idx == 1) return (p1 + cur) / 2;
    if (idx == 2) return (p2 + p1 + cur) / 3;

    int sum = p3 + p2 + p1 + cur;
    return sum >> 2;
}

void check_alarm(int i, int s, int T) {
    if (s > T) {
        alarm_count++;
        if (first_alarm_idx == -1) {
            first_alarm_idx = i;
        }
    }
}

int main(void) {
    unsigned int x = SID;
    int i;
    int p1 = 0, p2 = 0, p3 = 0;
    int T = 90 + (SID % 20);

    /* Tek geçişli döngü birleştirme (loop fusion): üretim, filtreleme ve alarm kontrolü tek döngüde */
    for (i = 0; i < N; i++) {
        x = (1664525 * x + 1013904223);
        int cur = (((x >> 16) & 0xFFFF) % R) + B;
        arr[i] = mov_avg(p3, p2, p1, cur, i);
        p3 = p2;
        p2 = p1;
        p1 = cur;
        check_alarm(i, arr[i], T);
    }

    return 0;
}
